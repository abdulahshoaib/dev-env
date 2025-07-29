#!/usr/bin/env bash

FONT_DIR="../.font"
TMP_DIR="$(mktemp -d)"
fonts=(VictorMono FiraCode FiraMono Hasklig Hermit BigBlueTerminal MartianMono)

mkdir -p "$FONT_DIR"

for font in "${fonts[@]}"; do
  zipname="${font// /}"  # remove spaces
  url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/${zipname}.zip"
  target_dir="${FONT_DIR}/${zipname}"

  mkdir -p "$target_dir"

  echo "Downloading ${font}..."
  if wget -q --show-progress "$url" -O "${TMP_DIR}/${zipname}.zip"; then
    unzip -oq "${TMP_DIR}/${zipname}.zip" -d "${target_dir}"
    echo "Installed ${font} into ${target_dir}"
  else
    echo "Failed to download ${font} from $url"
  fi
done

# Clean up
rm -rf "$TMP_DIR"

# Rebuild font cache
echo "Rebuilding font cache..."
fc-cache -fv "$FONT_DIR"
