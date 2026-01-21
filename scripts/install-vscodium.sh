#!/usr/bin/env bash
set -e

echo "Installing vscodium from flatpak"
flatpak install -y com.vscodium.codium


echo "Installing extensions from vscodium/extensions.txt..."
EXT_FILE="$(dirname "$0")/../vscodium/extensions.txt"

while IFS= read -r ext; do
  [[ -z "$ext" ]] && continue
  flatpak run com.vscodium.codium --install-extension "$ext"
done < "$EXT_FILE"
