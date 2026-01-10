#!/usr/bin/env bash
set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Installing core development tools..."
sudo dnf install -y \
    git \
    curl \
    wget \
    unzip \
    jq \
    tree \
    python3 \
    python3-pip \
    gcc \
    gcc-c++ \
    make \
    openssl \
    openssl-devel \
    direnv \
    which \

echo "Core packages installed."
