#!/bin/bash

workspace=$(xprop -root | grep '_NET_CURRENT_DESKTOP(CARDINAL)' | awk '{print $5}')
echo "Current workspace: $workspace" >&2

window_ids=$(xprop -root _NET_CLIENT_LIST_STACKING | awk '{for (i=5; i<=NF; i++) print $i}')
echo "Window IDs: $window_ids" >&2

icons=""

for win_id in $window_ids; do
    win_workspace=$(xprop -id $win_id _NET_WM_DESKTOP | awk '{print $5}')
    echo "Window $win_id is on workspace: $win_workspace" >&2
    if [[ $win_workspace -eq $workspace ]]; then
        # Get window title
        title=$(xprop -id $win_id WM_NAME | sed -e 's/WM_NAME(STRING) = //' -e 's/WM_NAME(COMPOUND_TEXT) = //' -e 's/WM_NAME(UTF8_STRING) = //')
        echo "Window $win_id title: $title" >&2
        # Add title to icons (replace with actual icon logic if available)
        if [[ ! -z $title ]]; then
            icons+=" $title"
        fi
    fi
done

echo "$icons"
