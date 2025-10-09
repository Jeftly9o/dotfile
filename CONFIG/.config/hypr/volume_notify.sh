#!/bin/bash

# Cambiar el volumen según parámetro
case "$1" in
    up)
        pamixer -i 5 ;;   # Subir 5%
    down)
        pamixer -d 5 ;;   # Bajar 5%
    mute)
        pamixer -t ;;     # Silenciar / activar
esac

# Obtener volumen actual
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

# Mostrar notificación en mako
if [ "$MUTED" = "true" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume \
                -h int:value:"$VOLUME" "🔇 Volumen muteado"
else
    notify-send -h string:x-canonical-private-synchronous:volume \
                -h int:value:"$VOLUME" "🔊 Volumen: ${VOLUME}%"
fi
