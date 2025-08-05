#!/bin/bash

max_len=30

title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
status=$(playerctl status)

icon=""

if [[ -n "$title" && -n "$artist" ]]; then
    song="$artist - $title"
    if [[ "$status" == "Playing" ]]; then
		icon="   "
	elif [[ "$status" == "Paused" ]]; then
		icon="   "
	else
		icon=""
	fi
else
    song=""
fi



final="$icon $song"

if (( ${#final} > max_len )); then
    echo "${final:0:max_len-3}..."
else
    echo "$final"
fi

