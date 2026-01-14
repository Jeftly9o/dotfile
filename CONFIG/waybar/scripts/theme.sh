#!/usr/bin/env bash

THEME=$1
THEME_DIR="$HOME/.config/themes/$THEME"

if [ ! -d "$THEME_DIR" ]; then
    echo "El tema $THEME no existe"
    exit 1
fi

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
sleep 0.5
notify-send "Tema cambiado a $THEME"
