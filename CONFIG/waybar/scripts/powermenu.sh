#!/bin/bash

options=" Apagar\n Reiniciar\n Suspender\n Cerrar sesión"

chosen=$(echo -e "$options" | wofi --dmenu --prompt "Power" --width=100 --height=20)

case "$chosen" in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Suspender") systemctl suspend ;;
    " Cerrar sesión") hyprctl dispatch exit || swaymsg exit ;;
esac

