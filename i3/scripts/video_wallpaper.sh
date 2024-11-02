#!/bin/bash
VIDEO_PATH="/home/sasuke/Downloads/SnapSave.io-THIS IS 4K ANIME (Sasuke).mp4"
xwinwrap -ni -o 0.6 -fs -s -st -sp -b -nf -- mpv --mute=yes --loop --no-audio --wid=$WINDOWID "$VIDEO_PATH"

