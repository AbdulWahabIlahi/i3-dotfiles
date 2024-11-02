#!/bin/bash

current_brightness=$(xrandr --verbose | grep -i brightness | awk '{print $2}')
new_brightness=$(echo "$current_brightness - 0.1" | bc)
min_brightness=0.1

if (( $(echo "$new_brightness < $min_brightness" | bc -l) )); then
    new_brightness=$min_brightness
fi

xrandr --output $(xrandr | grep ' connected' | awk '{ print $1 }') --brightness $new_brightness
