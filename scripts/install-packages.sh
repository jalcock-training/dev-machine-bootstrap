#!/usr/bin/env bash
set -euo pipefail

echo "=== Fedora 43 DevSecOps Workstation Bootstrap ==="

# ----------------------------------------------------
# Detect OS + DNF version
# ----------------------------------------------------
source /etc/os-release

OS_FAMILY="${ID_LIKE:-}"
OS_FAMILY="${OS_FAMILY,,}"

if command -v dnf5 >/dev/null 2>&1; then
    DNF_CMD="dnf5"
else
    DNF_CMD="dnf"
fi

echo "Using package manager: $DNF_CMD"
echo "Detected OS: $PRETTY_NAME"

# ----------------------------------------------------
# Determine HashiCorp repo URL
# ----------------------------------------------------
if [[ "$ID" == "fedora" || "$OS_FAMILY" == *"fedora"* ]]; then
    REPO_URL="https://rpm.releases.hashicorp.com/fedora/hashicorp.repo"
elif [[ "$OS_FAMILY" == *"rhel"* || "$OS_FAMILY" == *"centos"* ]]; then
    REPO_URL="https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo"
else
    echo "Unsupported OS family. Exiting."
    exit 1
fi

# ----------------------------------------------------
# Install core system packages
# ----------------------------------------------------
echo "Installing core system packages..."
sudo $DNF_CMD install -y \
    git \
    jq \
    unzip \
    curl \
    wget \
    python3 \
    python3-pip \
    python3-virtualenv \
    python3-setuptools \
    python3-wheel

# ----------------------------------------------------
# Install HashiCorp repo (idempotent)
# ----------------------------------------------------
if [[ -f /etc/yum.repos.d/hashicorp.repo ]]; then
    echo "HashiCorp repo already exists. Skipping."
else
    echo "Adding HashiCorp repository: $REPO_URL"
    if [[ "$DNF_CMD" == "dnf5" ]]; then
        sudo $DNF_CMD config-manager addrepo --from-repofile="$REPO_URL"
    else
        sudo $DNF_CMD install -y dnf-plugins-core
        sudo $DNF_CMD config-manager --add-repo "$REPO_URL"
    fi
fi

# ----------------------------------------------------
# Install Terraform (idempotent via DNF)
# ----------------------------------------------------
echo "Installing Terraform..."
sudo $DNF_CMD install -y terraform

# ----------------------------------------------------
# Install tflint (idempotent)
# ----------------------------------------------------
if command -v tflint >/dev/null 2>&1; then
    echo "tflint already installed. Skipping."
else
    echo "Installing tflint..."
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
fi

# ----------------------------------------------------
# Install AWS CLI v2 (idempotent)
# ----------------------------------------------------
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI already installed. Skipping."
else
    echo "Installing AWS CLI v2..."
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip -q awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
fi

# ----------------------------------------------------
# Install OPA (idempotent)
# ----------------------------------------------------
if command -v opa >/dev/null 2>&1; then
    echo "OPA already installed. Skipping."
else
    echo "Installing OPA..."
    curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64_static
    chmod +x opa
    sudo mv opa /usr/local/bin/
fi

# ----------------------------------------------------
# Install Conftest (idempotent + fixed)
# ----------------------------------------------------
if command -v conftest >/dev/null 2>&1; then
    echo "Conftest already installed. Skipping."
else
    echo "Installing Conftest..."
    curl -L -o conftest https://github.com/open-policy-agent/conftest/releases/latest/download/conftest_Linux_x86_64
    chmod +x conftest
    sudo mv conftest /usr/local/bin/
fi

# ----------------------------------------------------
# Install Python security tooling (idempotent)
# ----------------------------------------------------
echo "Installing Python security tooling..."
pip3 install --upgrade pip

pip3 install --upgrade \
    bandit \
    pip-audit \
    cyclonedx-bom \
    pytest

# ----------------------------------------------------
# Install Checkov (idempotent)
# ----------------------------------------------------
echo "Installing Checkov..."
pip3 install --upgrade checkov

# ----------------------------------------------------
# Optional extras
# ----------------------------------------------------
echo "Installing optional utilities..."
sudo $DNF_CMD install -y pre-commit

echo "=== Bootstrap complete ==="

