#!/usr/bin/env bash

THEME=$1
THEME_DIR="$HOME/.config/themes/$THEME"

if [ ! -d "$THEME_DIR" ]; then
    echo "El tema $THEME no existe"
    exit 1
fi

# Cambiar wallpaper
cp "$THEME_DIR/hypr/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf

# Cambiar Waybar
cp "$THEME_DIR/waybar/style.css" ~/.config/waybar/style.css
cp "$THEME_DIR/waybar/config.jsonc" ~/.config/waybar/config.jsonc

# Cambiar Rofi
ln -sf "$THEME_DIR/rofi/menu.rasi" ~/.config/rofi/themes/menu.rasi

# Cambiar terminal (ej. Kitty)
cp "$THEME_DIR/kitty/theme.conf" ~/.config/kitty/theme.conf
kitty @ set-colors --all ~/.config/kitty/theme.conf
killall -USR1 kitty # recarga config en kitty
#reiniciar todo
pkill waybar && waybar &
killall hyprpaper 2>/dev/null
sleep 0.5
hyprpaper &
notify-send "Tema cambiado a $THEME"
