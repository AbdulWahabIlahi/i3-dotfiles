#!/bin/bash

if pgrep -x "picom" > /dev/null
then
    pkill picom
    echo "Picom stopped."
else
    picom -b
    echo "Picom started."
fi
