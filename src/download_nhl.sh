#!/bin/bash

# Download today's Kraken game (if any)
# ./src/download_nhl.sh kraken  

# Download Kraken game for specific date
# ./download_nhl.sh kraken --date 2025-01-06

# Constants
readonly KRAKEN_TEAM_ID=55
readonly API_BASE_URL="https://api-web.nhle.com/v1"
readonly DATA_BASE_DIR="data/NHL - National Hockey League"

# Function to print usage instructions
usage() {
    echo "Usage: $0 [team] [date]"
    echo "  team: kraken (default)"
    echo "  date: Optional date in YYYY-MM-DD format (defaults to today)"
    exit 1
}

# Determine NHL season based on date
get_nhl_season() {
    local date=$1
    local year=${date:0:4}
    local month=${date:5:2}
    
    if [ "$month" -ge "09" ]; then
        echo "${year}-$((${year:2:2} + 1))"
    else
        echo "$((year-1))-${year:2:2}"
    fi
}

# Get game type string
get_game_type_string() {
    local type_id=$1

    # TODO: Keep an eye on this for unexpected type_id
    if [ "$type_id" = "2" ]; then
        echo "regular-season"
    else
        echo "preseason"
    fi
}

# Fetch and validate JSON data from NHL API
fetch_nhl_data() {
    local endpoint=$1
    local data=$(curl -s "${API_BASE_URL}/${endpoint}")
    
    if ! echo "$data" | jq -e . >/dev/null 2>&1; then
        echo "Error: Failed to get valid data from ${endpoint}"
        exit 1
    fi
        
    echo "$data"
}

# Function to download and save NHL game data
download_nhl_game() {
    local date=$1
    local game_id=$2
    local away_team=$3
    local home_team=$4
    local game_type=$5
    
    local season=$(get_nhl_season "$date")
    local dir="${DATA_BASE_DIR}/${season}/${game_type}"
    mkdir -p "$dir"

    local filename="${date//-/}"-"${away_team}-vs-${home_team}-${game_id}.json"
    local filepath="${dir}/${filename}"

    echo "Downloading game data to ${filepath}..."
    fetch_nhl_data "gamecenter/${game_id}/play-by-play" | python3 -m json.tool > "$filepath"
}

# Find Kraken game from scores data
find_kraken_game() {
    local scores_data=$1
    echo "$scores_data" | jq -r ".games[] | select(.awayTeam.id == ${KRAKEN_TEAM_ID} or .homeTeam.id == ${KRAKEN_TEAM_ID}) | \"\(.id) \(.awayTeam.abbrev) \(.homeTeam.abbrev) \(.gameType)\""
}

# Main execution
main() {
    local team=${1:-kraken}
    local date=${2:-$(date +%Y-%m-%d)}

    # Validate team
    # TODO: Add support for other NHL teams
    if [ "$team" != "kraken" ]; then
        echo "Error: Only 'kraken' NHL data downloading is supported"
        usage
    fi

    echo "Checking for Kraken game data from ${date}..."
    local scores_data=$(fetch_nhl_data "score/${date}")
    local game_info=$(find_kraken_game "$scores_data")

    if [ -z "$game_info" ]; then
        echo "No Kraken game data was found for ${date}"
        exit 0
    fi

    read -r game_id away_team home_team game_type <<< "$game_info"
    game_type=$(get_game_type_string "$game_type")

    download_nhl_game "$date" "$game_id" "$away_team" "$home_team" "$game_type"
    echo "Done!"
}

# Execute main function with all arguments
main "$@" 