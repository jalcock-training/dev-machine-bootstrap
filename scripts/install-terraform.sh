#!/usr/bin/env bash
set -e

echo "Adding HashiCorp repository..."

sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

echo "Installing Terraform..."
sudo dnf install -y terraform

echo "Terraform installation complete."
