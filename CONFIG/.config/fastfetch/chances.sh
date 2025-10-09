#!/usr/bin/env bash
fastfetch --logo-type file --logo "$(ls ~/.config/fastfetch/images/ | shuf -n 1 | kitty +kitten icat "$IMAGES/$RANDOM_IMG" ~/.config/fastfetch/images/{})"


