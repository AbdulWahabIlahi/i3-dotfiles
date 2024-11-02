#!/bin/bash

# Get the network interface (change wlan0 to your actual interface)
INTERFACE="wlan0"

# Get the data usage since boot using vnstat
DATA_USAGE=$(vnstat -i "$INTERFACE" --oneline b | awk -F';' '{print $9}')

# Function to convert bytes to human-readable format
human_readable() {
    local bytes=$1
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes} B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$((bytes / 1024)) KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$((bytes / 1048576)) MB"
    else
        echo "$((bytes / 1073741824)) GB"
    fi
}

# Convert the data usage to a human-readable format
READABLE_USAGE=$(human_readable $DATA_USAGE)

# Output the data usage for Polybar
echo "$READABLE_USAGE"
