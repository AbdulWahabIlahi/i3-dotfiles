#!/bin/bash

battery_percentage=$(acpi -b | grep -P -o '[0-9]+(?=%)')
echo "${battery_percentage}%"
