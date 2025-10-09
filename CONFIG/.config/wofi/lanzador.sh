#!/bin/bash
BASE_STYLE="$HOME/.config/wofi/style.css"
TMP_STYLE="/tmp/wofi-style-fixed.css"
IMAGEN="$HOME/wallpapers/blue-girl-among-flowers.jpg"

if [[ ! -f "$IMAGEN" ]]; then
    echo "Error: La imagen no se encontró en la ruta especificada: $MI_IMAGEN_FIJA"
    # Si la imagen no existe, lanza wofi con el estilo base para no fallar
    wofi --show drun -S "$BASE_STYLE"
    exit 1
fi

# 2. Copiar el estilo base y añadir la imagen de fondo al archivo temporal
cat "$BASE_STYLE" > "$TMP_STYLE"
echo "
window {
    background-image: url(\"$MI_IMAGEN_FIJA\");
    background-size: cover;
    background-position: center;
}" >> "$TMP_STYLE"

# 3. Lanzar Wofi con el estilo que acabamos de crear
wofi --show drun -S "$TMP_STYLE"

exit 0
