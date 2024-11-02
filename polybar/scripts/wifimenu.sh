#!/bin/bash
chosen=$(nmcli device wifi list | rofi -dmenu -i -p "Wi-Fi Networks" | awk '{print $1}')
if [ -n "$chosen" ]; then
    nmcli device wifi connect "$chosen"
fi
