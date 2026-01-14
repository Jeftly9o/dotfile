#!/usr/bin/env bash

themes=$(ls ~/.config/themes)
chosen=$(echo "$themes" | rofi -dmenu -p "Elige un tema" -theme ~/.config/rofi/themes/menu.rasi)

if [ -n "$chosen" ]; then
    ~/.config/waybar/scripts/theme.sh "$chosen"
fi
