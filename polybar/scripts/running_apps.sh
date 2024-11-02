#!/bin/bash

# Define icons for applications
TELEGRAM_ICON=""
COPYQ_ICON=""

# Initialize the output
output=""

# Check if Telegram is running
if wmctrl -lx | grep -q "telegram-desktop.Telegram"; then
    output="$output $TELEGRAM_ICON"
fi

# Check if CopyQ is running
if wmctrl -lx | grep -q "copyq.Copyq"; then
    output="$output $COPYQ_ICON"
fi

# Output the result
echo $output
