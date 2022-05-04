#!/bin/bash 
set -eu

# Start script
sudo echo "Starting general setup..."

# System upgrade
echo "[1/5] System upgrade"
pacman -Syu --needed --noconfirm

# Install necessary packages
echo "[2/5] Installing necessary packages"
for pckg in `cat pkglist.txt` 
do
    pamac install $pckg --no-confirm
done
pacman -R --noconfirm palemoon-bin

# Setup terminal config
echo "[3/5] Setting up terminal"

# OhMyZsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Script paused. Run the zsh script now."
exec zsh

