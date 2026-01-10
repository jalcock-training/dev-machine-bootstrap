#!/usr/bin/env bash
set -e

echo "Adding Microsoft Azure CLI repository..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

printf "[azure-cli]\n\
name=Azure CLI\n\
baseurl=https://packages.microsoft.com/yumrepos/azure-cli\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://packages.microsoft.com/keys/microsoft.asc\n" \
| sudo tee /etc/yum.repos.d/azure-cli.repo > /dev/null

echo "Installing Azure CLI..."
sudo dnf install -y azure-cli

echo "Azure CLI installation complete."
