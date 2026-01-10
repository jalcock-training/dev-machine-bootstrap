#!/usr/bin/env bash
set -e

# Resolve script directory so paths work no matter where you run it from
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXT_FILE="$SCRIPT_DIR/../vscode/extensions.txt"

if [[ ! -f "$EXT_FILE" ]]; then
    echo "Error: extensions.txt not found at $EXT_FILE"
    exit 1
fi

echo "Installing VSCodium extensions from $EXT_FILE..."

while IFS= read -r ext; do
    # Skip empty lines and comments
    [[ -z "$ext" ]] && continue
    [[ "$ext" =~ ^# ]] && continue

    echo "Installing extension: $ext"
    codium --install-extension "$ext" || {
        echo "Warning: failed to install $ext"
    }
done < "$EXT_FILE"

echo "Extension installation complete."
