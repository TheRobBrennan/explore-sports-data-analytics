#!/bin/bash

# Download today's Kraken game (if any)
# ./src/download_nhl.sh kraken  

# Download Kraken game for specific date
# ./download_nhl.sh kraken --date 2025-01-06

# Function to print usage instructions
usage() {
    echo "Usage: $0 team [date]"
    echo "  team: kraken"
    echo "  date: Optional date in YYYY-MM-DD format (defaults to today)"
    exit 1
}

# Function to download and save NHL game data
download_nhl_game() {
    local date=$1
    local game_id=$2
    local away_team=$3
    local home_team=$4
    local game_type=$5
    
    # Determine season based on date
    local year=${date:0:4}
    local month=${date:5:2}
    if [ "$month" -ge "09" ]; then
        local season="${year}-$((${year:2:2} + 1))"
    else
        local season="$((year-1))-${year:2:2}"
    fi

    # Create directory structure
    local dir="data/NHL - National Hockey League/${season}/${game_type}"
    mkdir -p "$dir"

    # Create filename
    local filename="${date//-/}"-"${away_team}-vs-${home_team}-${game_id}.json"
    local filepath="${dir}/${filename}"

    # Download play-by-play data
    echo "Downloading game data to ${filepath}..."
    curl -s "https://api-web.nhle.com/v1/gamecenter/${game_id}/play-by-play" | \
        python3 -m json.tool > "$filepath"
}

# Check arguments
if [ $# -lt 1 ]; then
    usage
fi

team=$1
date=${2:-$(date +%Y-%m-%d)}

# Validate team
if [ "$team" != "kraken" ]; then
    echo "Error: Only 'kraken' team is supported"
    usage
fi

# Download scores for the date
echo "Checking for Kraken game on ${date}..."
scores_data=$(curl -s "https://api-web.nhle.com/v1/score/${date}")

# Check if we got valid JSON
if ! echo "$scores_data" | jq -e . >/dev/null 2>&1; then
    echo "Error: Failed to get valid score data"
    exit 1
fi

# Find Kraken game (team ID 55)
game_info=$(echo "$scores_data" | jq -r '.games[] | select(.awayTeam.id == 55 or .homeTeam.id == 55) | "\(.id) \(.awayTeam.abbrev) \(.homeTeam.abbrev) \(.gameType)"')

if [ -z "$game_info" ]; then
    echo "No Kraken game found for ${date}"
    exit 0
fi

# Parse game info
read -r game_id away_team home_team game_type <<< "$game_info"

# Determine game type
if [ "$game_type" = "2" ]; then
    game_type="regular-season"
else
    game_type="preseason"
fi

# Download the game data
download_nhl_game "$date" "$game_id" "$away_team" "$home_team" "$game_type"

echo "Done!" 