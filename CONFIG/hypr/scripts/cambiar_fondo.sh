#!/usr/bin/env bash

# Carpeta donde están tus wallpapers
WALLPAPERS="$HOME/wallpapers/"

# Elige una imagen aleatoria
WP=$(find "$WALLPAPERS" -type f | shuf -n 1)
# Opciones de animación
swww img "$WP" \
  --transition-type=wipe \
  --transition-fps=60 \
  --transition-duration=1.5

ln -sf "$WP" /home/jeftly/.cache/current_wallpaper.png
