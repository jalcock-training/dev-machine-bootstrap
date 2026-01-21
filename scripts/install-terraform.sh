#!/usr/bin/env bash
set -e

echo "Detecting OS family..."

# Read OS information
source /etc/os-release

OS_FAMILY="${ID_LIKE,,}"

# Determine repo URL
if [[ "$ID" == "fedora" || "$OS_FAMILY" == *"fedora"* ]]; then
    echo "Detected Fedora-based system: $PRETTY_NAME"
    REPO_URL="https://rpm.releases.hashicorp.com/fedora/hashicorp.repo"
elif [[ "$OS_FAMILY" == *"rhel"* || "$OS_FAMILY" == *"centos"* ]]; then
    echo "Detected RHEL/Rocky/Alma-based system: $PRETTY_NAME"
    REPO_URL="https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"
else
    echo "Unsupported or unrecognized OS: $PRETTY_NAME"
    exit 1
fi

# Detect DNF version (dnf5 vs dnf4)
if command -v dnf5 >/dev/null 2>&1; then
    DNF_CMD="dnf5"
    ADD_REPO_CMD="config-manager addrepo --from-repofile=${REPO_URL}"
else
    DNF_CMD="dnf"
    ADD_REPO_CMD="config-manager --add-repo ${REPO_URL}"
fi

echo "Using package manager: $DNF_CMD"

echo "Installing required plugins..."
sudo $DNF_CMD install -y dnf-plugins-core || true

echo "Adding HashiCorp repository..."
sudo $DNF_CMD $ADD_REPO_CMD

echo "Installing Terraform..."
sudo $DNF_CMD install -y terraform

echo "Terraform installation complete."

