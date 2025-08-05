#!/bin/bash

if ip link show | grep -q "state UP"; then
    SSID=$(iwgetid -r)
    if [[ -n "$SSID" ]]; then
        echo "[ ]"
    else
        echo "[🔌]"
    fi
else
    echo "[󰖪 ]"
fi

