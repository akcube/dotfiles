#!/bin/zsh
set -eu

# Spaceship prompt
paru -S --noconfirm --needed spaceship-prompt

# Set default to zsh
sudo chsh -s $(which zsh)

# Plugins
echo "[6/5] Plugins & errata"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

