#!/usr/bin/env bash
set -e

echo "Configuring Git identity..."
git config --global user.name "James Alcock"
git config --global user.email "james.alcock.training@proton.me"

echo "Setting Git defaults..."
git config --global pull.rebase false
git config --global init.defaultBranch main
git config --global core.editor "codium --wait"

echo "Checking for SSH key..."
if [[ ! -f ~/.ssh/id_ed25519 ]]; then
  echo "Generating SSH key..."
  ssh-keygen -t ed25519 -C "james.alcock.training@proton.me" -f ~/.ssh/id_ed25519 -N ""
fi

echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Your public key:"
cat ~/.ssh/id_ed25519.pub

echo "Add this key to GitHub → https://github.com/settings/keys"
