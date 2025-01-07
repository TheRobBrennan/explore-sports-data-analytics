#!/bin/bash

# Download today's Thunderbirds game (if any)
# ./src/download_whl.sh  

# Download Thunderbirds game for specific date
# ./download_whl.sh thunderbirds 2025-01-07

# Constants
readonly THUNDERBIRDS_TEAM_ID=214
readonly SEASON_ID=285  # 2024-25 season
readonly API_KEY="41b145a848f4bd67"
readonly API_BASE_URL="https://cluster.leaguestat.com/feed/index.php"
readonly DATA_BASE_DIR="data/WHL - Western Hockey League"
readonly SCHEDULE_BASE_URL="https://chl.ca/whl-thunderbirds/schedule"

# Function to print usage instructions
usage() {
    echo "Usage: $0 [team] [date]"
    echo "  team: thunderbirds (default)"
    echo "  date: Optional date in YYYY-MM-DD format (defaults to today)"
    exit 1
}

# Function to log errors
log_error() {
    echo "Error: $1" >&2
}

# Function to validate date format
validate_date() {
    local date=$1
    if [[ ! $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        log_error "Invalid date format. Please use YYYY-MM-DD"
        return 1
    fi
    
    # Additional validation if needed
    local year=${date:0:4}
    local month=${date:5:2}
    local day=${date:8:2}
    
    if [ "$month" -lt 1 ] || [ "$month" -gt 12 ] || [ "$day" -lt 1 ] || [ "$day" -gt 31 ]; then
        log_error "Invalid date values. Month must be 1-12, Day must be 1-31"
        return 1
    fi
    
    return 0
}

# Function to fetch and validate JSON data from WHL API
fetch_whl_data() {
    local game_id=$1
    local tab=$2
    local url="${API_BASE_URL}?feed=gc&game_id=${game_id}&key=${API_KEY}&client_code=whl&lang_code=en&fmt=json&tab=${tab}"
    local data
    
    # Fetch data with timeout and retry
    for i in {1..3}; do
        data=$(curl -s --max-time 10 "$url")
        if [ $? -eq 0 ] && [ -n "$data" ]; then
            break
        fi
        if [ $i -eq 3 ]; then
            log_error "Failed to fetch data after 3 attempts from ${url}"
            return 1
        fi
        sleep 2
    done
    
    # Validate JSON
    if ! echo "$data" | jq -e . >/dev/null 2>&1; then
        log_error "Invalid JSON data received from ${url}"
        return 1
    fi
        
    echo "$data"
    return 0
}

# Function to fetch schedule HTML and extract game ID for date
get_game_id_for_date() {
    local target_date=$1
    local schedule_url="https://cluster.leaguestat.com/feed/index.php?feed=modulekit&view=schedule&key=${API_KEY}&fmt=json&client_code=whl&lang=en&season_id=${SEASON_ID}&team_id=${THUNDERBIRDS_TEAM_ID}&league_code=&fmt=json"
    
    echo "Debug: Attempting to fetch schedule from: ${schedule_url}" >&2
    
    local schedule_data
    schedule_data=$(curl -s --max-time 10 \
        -H "Accept: application/json" \
        "$schedule_url")
    
    echo "Debug: First 200 chars of response: ${schedule_data:0:200}" >&2
    
    # Extract game ID for target date using jq
    local game_id
    game_id=$(echo "$schedule_data" | jq -r --arg date "$target_date" '.SiteKit.Schedule[] | select(.date_played == $date) | .game_id')

    if [ -z "$game_id" ]; then
        log_error "No game found for date ${target_date}"
        return 1
    fi

    echo "$game_id"
    return 0
}

# Function to download and save WHL game data
download_whl_game() {
    local date=$1
    local game_id=$2
    
    # Get game summary to determine teams
    local summary_data
    summary_data=$(fetch_whl_data "$game_id" "gamesummary")
    if [ $? -ne 0 ]; then
        log_error "Failed to fetch game summary"
        return 1
    fi
    
    # Extract team names
    local home_team
    local visiting_team
    home_team=$(echo "$summary_data" | jq -r '.GC.Gamesummary.meta.home_team')
    visiting_team=$(echo "$summary_data" | jq -r '.GC.Gamesummary.meta.visiting_team')
    
    if [ -z "$home_team" ] || [ -z "$visiting_team" ]; then
        log_error "Failed to extract team names from game summary"
        return 1
    fi
    
    # Format date for filename
    local file_date=${date//-/}
    
    # Create season directory
    local season="2024-25"  # TODO: Calculate based on date
    local dir="${DATA_BASE_DIR}/${season}"
    mkdir -p "$dir"

    # Save game summary
    local summary_filename="${file_date}-${visiting_team}-vs-${home_team}-${game_id}-gamesummary.json"
    local summary_filepath="${dir}/${summary_filename}"
    echo "Downloading game summary to ${summary_filepath}..."
    if ! echo "$summary_data" | python3 -m json.tool > "$summary_filepath"; then
        log_error "Failed to save game summary"
        return 1
    fi

    # Save play-by-play
    local pxp_data
    pxp_data=$(fetch_whl_data "$game_id" "pxpverbose")
    if [ $? -ne 0 ]; then
        log_error "Failed to fetch play-by-play data"
        return 1
    fi
    
    local pxp_filename="${file_date}-${visiting_team}-vs-${home_team}-${game_id}-pxpverbose.json"
    local pxp_filepath="${dir}/${pxp_filename}"
    echo "Downloading play-by-play to ${pxp_filepath}..."
    if ! echo "$pxp_data" | python3 -m json.tool > "$pxp_filepath"; then
        log_error "Failed to save play-by-play data"
        return 1
    fi

    return 0
}

# Main execution
main() {
    local team=${1:-thunderbirds}
    local today=$(date '+%Y-%m-%d')  # Store date in a variable first
    local date=${2:-$today}          # Use the stored date as default

    # Debug output
    echo "Debug: date=$date"
    echo "Debug: team=$team"

    # Validate team
    if [ "$team" != "thunderbirds" ]; then
        log_error "Only 'thunderbirds' WHL data downloading is supported"
        usage
    fi

    # Validate date format
    if ! validate_date "$date"; then
        usage
    fi

    echo "Checking for Thunderbirds game data from ${date}..."
    local game_id
    game_id=$(get_game_id_for_date "$date")
    if [ $? -ne 0 ]; then
        exit 1
    fi

    if [ -z "$game_id" ]; then
        echo "No Thunderbirds game data was found for ${date}"
        exit 0
    fi

    if ! download_whl_game "$date" "$game_id"; then
        log_error "Failed to download game data"
        exit 1
    fi

    echo "Done!"
    exit 0
}

# Execute main function with all arguments
main "$@" 