#!/bin/bash

INTERFACE="wlan0" # Replace with your network interface

get_upload_speed() {
    local old_value=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    sleep 1
    local new_value=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    echo "scale=2; ($new_value - $old_value) / 1024" | bc
}

upload_speed=$(get_upload_speed)
upload_speed=$(echo "scale=2; $upload_speed / 1000" | bc)
echo "${upload_speed} MB/s"
