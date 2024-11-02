#!/bin/bash
# Generate a temporary file to hold the menu items
tempfile=$(mktemp)

# Fetch the prices using the Python script
~/crypto_prices.py > "$tempfile"

# Use rofi to display the menu
rofi -dmenu -p "Crypto Prices" -i < "$tempfile"

# Clean up
rm "$tempfile"
