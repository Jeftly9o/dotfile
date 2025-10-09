#!/bin/bash
WALLPAPER_DIR=~/wallpapers/
FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
killall hyprpaper 2>/dev/null
sleep 0.5
hyprpaper &

sleep 0.5
hyprctl hyprpaper preload "$FILE"
hyprctl hyprpaper wallpaper "eDP-1,$FILE"
