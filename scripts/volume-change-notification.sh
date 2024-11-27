#!/bin/bash

# Get the output of volumectl
volume_output=$(volumectl)

# Extract the volume percentage
volume=$(echo "$volume_output" | grep -o 'Volume: [0-9]*%' | sed 's/[^0-9]//g')

# Ensure volume is not empty
if [[ -z "$volume" ]]; then
  echo "Error: Could not extract volume." >&2
  exit 1
fi

# Display a notification
#notify-send -h int:value:"$volume" "Volume $volume%"
#notify-send -h int:value:"$volume" -i audio-volume-high "Volume $volume%"


if [ "$volume" -eq 0 ]; then
	notify-send -u low -h int:value:$volume -i /home/sumit/myicons/volume/48/volume-off.png "Volume $volume%" -r 101 -t 2000
	echo "zero"
elif [ "$volume" -le 33 ]; then
	notify-send -u low -h int:value:$volume -i /home/sumit/myicons/volume/48/volume-low.png "Volume $volume%" -r 101 -t 2000
	echo "low"
elif [ "$volume" -le 66 ]; then
	notify-send -u low -h int:value:$volume -i /home/sumit/myicons/volume/48/volume-medium.png "Volume $volume%" -r 101 -t 2000
	echo "medium"
elif [ "$volume" -gt 66 ]; then
	notify-send -u low -h int:value:$volume -i /home/sumit/myicons/volume/48/volume-high.png "Volume $volume%" -r 101 -t 2000
	echo "high"
fi
