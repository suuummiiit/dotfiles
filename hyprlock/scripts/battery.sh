#!/bin/bash

battery=$(cat /sys/class/power_supply/BAT*/capacity)
status=$(cat /sys/class/power_supply/AC*/online)

if [ "$battery" -ge 90 ]; then
    icon=""
elif [ "$battery" -ge 70 ]; then
    icon=""
elif [ "$battery" -ge 50 ]; then
    icon=""
elif [ "$battery" -ge 30 ]; then
    icon=""
else
    icon=""
fi

# Add charger icon if plugged in
if [ "$status" -eq 1 ]; then
    icon="󱐋 $icon"
fi

echo "[$icon $battery%]"

