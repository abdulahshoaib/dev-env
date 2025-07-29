#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpapers"
WALLPAPER_NAME=$(bash "$HOME/.local/bin/randomizer.sh")
WALLPAPER_PATH="$WALLPAPER_DIR/$WALLPAPER_NAME"

if [[ -f "$WALLPAPER_PATH" ]]; then
    cp "$WALLPAPER_PATH" /usr/share/sddm/themes/sugar-dark/Background.jpg
fi
