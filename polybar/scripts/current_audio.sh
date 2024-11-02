#!/bin/bash

# Get the default sink
DEFAULT_SINK=$(pactl info | grep 'Default Sink' | awk '{print $3}')

# Get the sink inputs associated with the default sink
SINK_INPUTS=$(pactl list sink-inputs)

# Initialize variable to store application name
CURRENT_APP=""

# Parse sink inputs to find the application name
while IFS= read -r line; do
    if [[ $line == *"Sink Input"* ]]; then
        INPUT_INDEX=$(echo $line | awk '{print $3}')
    elif [[ $line == *"Sink: $DEFAULT_SINK"* ]]; then
        CURRENT_APP=$(echo "$SINK_INPUTS" | grep -A 20 "Sink Input #$INPUT_INDEX" | grep 'application.name' | awk -F '"' '{print $2}')
        break
    fi
done <<< "$SINK_INPUTS"

# Output the current application playing audio
if [ -z "$CURRENT_APP" ]; then
    echo "No audio playing"
else
    echo "Playing: $CURRENT_APP"
fi
