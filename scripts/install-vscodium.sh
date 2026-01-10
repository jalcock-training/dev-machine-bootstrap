#!/usr/bin/env bash
set -e

echo "Adding VSCodium repository..."

sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg

printf "[vscodium]\n\
name=VSCodium\n\
baseurl=https://download.vscodium.com/rpms/\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg\n" \
| sudo tee /etc/yum.repos.d/vscodium.repo > /dev/null

echo "Installing VSCodium..."
sudo dnf install -y codium

echo "Installing extensions from vscode/extensions.txt..."
EXT_FILE="$(dirname "$0")/../vscode/extensions.txt"

while IFS= read -r ext; do
  [[ -z "$ext" ]] && continue
  codium --install-extension "$ext"
done < "$EXT_FILE"

echo "VSCodium installation complete."
