#!/bin/bash
set -eu

# Start script
echo "Starting general setup..."

# Package install

# OhMyZsh

echo "[2/5] Installing OhMyZsh"
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Script paused. Run the zsh script now."
exec zsh

