#!/bin/bash

# Escucha cambios en el 'trackid' de cualquier reproductor compatible con MPRIS.
# Usamos 'trackid' porque es lo que cambia de forma fiable con cada nueva canción.
# Si quieres que solo escuche a Spotify, usa: playerctl --player=spotify ...
playerctl metadata --follow --format '{{ mpris:trackid }}' | while read -r trackid; do

    # Cuando el 'trackid' cambia, esta parte del script se ejecuta.
    # Obtenemos toda la metadata de la *nueva* canción.
    artist=$(playerctl metadata artist)
    title=$(playerctl metadata title)
    album=$(playerctl metadata album)
    art_url=$(playerctl metadata mpris:artUrl)

    # Enviamos la notificación. swaync la recogerá.
    notify-send -a "Spotify" \
                 -u low \
                 -t 5000 \
                 -i "$art_url" \
                 "$title" \
                 "$artist - $album"
done
