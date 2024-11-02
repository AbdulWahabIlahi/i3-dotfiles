#!/bin/bash

# Path to the directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/"

# Find a random image file from the directory
IMAGE_PATH=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Check if an image was found
if [ -z "$IMAGE_PATH" ]; then
    echo "No image files found in $WALLPAPER_DIR"
    exit 1
fi

# Generate color scheme and set wallpaper
wal -i "$IMAGE_PATH"

# Set wallpaper using feh
feh --bg-scale "$IMAGE_PATH"
