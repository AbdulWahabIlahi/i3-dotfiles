# #!/bin/bash

# # Function to get CPU temperature
# get_cpu_temp() {
#     temp=$(sensors | awk '/^Package id 0:/{print $4}' | cut -c 2-3)
#     echo ${temp:-0} # Return 0 if no temperature is found
# }

# # Function to get GPU temperature (NVIDIA)
# get_gpu_temp() {
#     temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n 1)
#     echo ${temp:-0} # Return 0 if no temperature is found
# }

# # Function to get NVMe SSD temperature
# get_ssd_temp() {
#     temp=$(sudo nvme smart-log /dev/nvme0 | awk '/^temperature/{print $3}')
#     echo ${temp:-0} # Return 0 if no temperature is found
# }

# # Function to get RAM temperature (if applicable)
# get_ram_temp() {
#     # Add specific commands for your RAM if it supports temperature readings
#     echo "0" # Default to 0 if not applicable
# }

# # Calculate average temperature
# calculate_average_temp() {
#     cpu_temp=$(get_cpu_temp)
#     gpu_temp=$(get_gpu_temp)
#     ssd_temp=$(get_ssd_temp)
#     ram_temp=$(get_ram_temp) # Optional, default to 0 if not applicable

#     # Sum the temperatures, count how many values are non-zero
#     total_temp=$((cpu_temp + gpu_temp + ssd_temp + ram_temp))
#     count=3
#     [ "$ram_temp" -ne 0 ] && count=$((count + 1))

#     # Calculate the average temperature
#     if [ "$count" -gt 0 ]; then
#         average_temp=$((total_temp / count))
#     else
#         average_temp=0
#     fi

#     echo $average_temp
# }

# # Get the average temperature
# average_temp=$(calculate_average_temp)

# # Determine the color based on the average temperature
# if [ "$average_temp" -lt 45 ]; then
#     color="%{F#00FF00}" # Green
# elif [ "$average_temp" -lt 70 ]; then
#     color="%{F#FFFF00}" # Yellow
# else
#     color="%{F#FF0000}" # Red
# fi

# # Output the temperature with color
# echo "${color} $average_temp°C"
