#!/bin/bash

INTERFACE="wlan0" # Replace with your network interface

get_download_speed() {
    local old_value=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    sleep 1
    local new_value=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    echo "scale=2; ($new_value - $old_value) / 1024" | bc
}

download_speed=$(get_download_speed)
download_speed=$(echo "scale=2; $download_speed / 1000" | bc)
echo "${download_speed} MB/s"
