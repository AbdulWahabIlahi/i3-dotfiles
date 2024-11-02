#!/bin/bash

# Get the active media title from Firefox or Brave using playerctl
media_title=$(playerctl -p firefox,brave-browser metadata title 2>/dev/null)

if [ -n "$media_title" ]; then
    echo "$media_title"
else
    echo "No media playing"
fi
