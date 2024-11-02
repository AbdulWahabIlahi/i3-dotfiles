#!/bin/bash

while true; do
    # Extract temperature and remove non-numeric characters
    TEMP=$(sensors | grep 'temp1' | awk '{print $2}' | sed 's/+//' | sed 's/°C//')
    BATTERY=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Check if battery is low (5%)
    if [[ $BATTERY -le 5 ]]; then
        notify-send -u critical -i battery-empty "Battery Critical" "<span color='red'>⚠️ Battery is at ${BATTERY}%.</span>"
    elif [[ $BATTERY -lt 20 ]]; then
        notify-send -u normal -i battery-low "Battery Low" "<span color='red'>Battery is at ${BATTERY}%.</span>"
    elif [[ $BATTERY -lt 80 ]]; then
        notify-send -u low -i battery-good "Battery Status" "<span color='yellow'>Battery is at ${BATTERY}%.</span>"
    else
        notify-send -u low -i battery-full "Battery Full" "<span color='green'>Battery is at ${BATTERY}%.</span>"
    fi

    # Check if temperature is above a threshold (e.g., 80°C)
    if [[ ${TEMP%%.*} -gt 80 ]]; then
        notify-send -u critical -i temperature-high "High Temperature" "<span color='red'>CPU temperature is ${TEMP}°C.</span>"
    fi

    # Sleep for 60 seconds before checking again
    sleep 60
done
