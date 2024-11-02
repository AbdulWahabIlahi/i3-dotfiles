#!/bin/bash

current_brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ')
new_brightness=$(echo "$current_brightness + 0.1" | bc)
max_brightness=1.0

if (( $(echo "$new_brightness > $max_brightness" | bc -l) )); then
    new_brightness=$max_brightness
fi

xrandr --output $(xrandr | grep ' connected' | awk '{ print $1 }') --brightness $new_brightness
