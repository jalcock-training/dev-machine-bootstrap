#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running full bootstrap for Fedora/Rocky..."

bash "$SCRIPT_DIR/install-packages.sh"
bash "$SCRIPT_DIR/install-vscodium.sh"
bash "$SCRIPT_DIR/install-terraform.sh"
bash "$SCRIPT_DIR/install-azure-cli.sh"
bash "$SCRIPT_DIR/setup-git.sh"
bash "$SCRIPT_DIR/vscodium-extensions.sh"
bash "$SCRIPT_DIR/install-brave.sh"

echo "Bootstrap complete. Your machine is ready."
