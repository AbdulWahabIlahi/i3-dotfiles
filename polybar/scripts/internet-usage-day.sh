#!/bin/bash

# Directory to store data
DATA_DIR="$HOME/.config/polybar/usage_data"
mkdir -p "$DATA_DIR"

# File to store usage data
DATA_FILE="$DATA_DIR/usage.txt"

# Function to get current network usage in bytes
get_usage() {
    rx_bytes=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
    tx_bytes=$(cat /sys/class/net/*/statistics/tx_bytes | awk '{s+=$1} END {print s}')
    echo "$((rx_bytes + tx_bytes))"
}

# Initialize the data file if it doesn't exist
if [ ! -f "$DATA_FILE" ]; then
    echo "$(date +%Y-%m-%d) $(get_usage)" > "$DATA_FILE"
fi

# Read the stored date and usage
read stored_date stored_usage < "$DATA_FILE"

# Get current date and usage
current_date=$(date +%Y-%m-%d)
current_usage=$(get_usage)

# Reset usage if the date has changed
if [ "$current_date" != "$stored_date" ]; then
    stored_date="$current_date"
    stored_usage="$current_usage"
    echo "$stored_date $stored_usage" > "$DATA_FILE"
fi

# Calculate today's usage
today_usage=$((current_usage - stored_usage))

# Convert bytes to a human-readable format (KB/MB/GB)
if [ "$today_usage" -lt 1024 ]; then
    usage_display="${today_usage}B"
elif [ "$today_usage" -lt 1048576 ]; then
    usage_display="$(echo "scale=2; $today_usage/1024" | bc)KB"
elif [ "$today_usage" -lt 1073741824 ]; then
    usage_display="$(echo "scale=2; $today_usage/1048576" | bc)MB"
else
    usage_display="$(echo "scale=2; $today_usage/1073741824" | bc)GB"
fi

# Output the usage to be used in Polybar
echo "Usage: $usage_display"
