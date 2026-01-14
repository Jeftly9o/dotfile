#!/bin/bash

if pgrep -x "hypridle" > /dev/null; then
    pkill -x hypridle
    notify-send "Hypridle desactivado"
else
    hypridle &
    notify-send "Hypridle activado"
fi
