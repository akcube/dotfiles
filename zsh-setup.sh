#!/bin/zsh
set -eu

# Spaceship prompt
ZSH_CUSTOM="/home/akcube/.oh-my-zsh/custom"
wget https://github.com/spaceship-prompt/spaceship-prompt/archive/master.zip
unzip master.zip && rm master.zip
mv spaceship-prompt-master/ spaceship-prompt/
yes | mv spaceship-prompt/ "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Kitty terminal
header=$(head -n 1 /usr/bin/terminal)
echo $header > /usr/bin/terminal
echo "
kitty $@
" >> /usr/bin/terminal

# Set default to zsh
chsh -s $(which zsh)

# Setup pulse audio
echo "[4/5] Setting up pulse audio and pavucontrol"
yes | install_pulse

# Setup config files
echo "[5/5] Applying pre-made configs"
cp -r home/. ~/
i3-msg restart

# Plugins
echo "[6/5] Plugins & errata"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

python -m ensurepip --upgrade
pip3 install thefuck

echo "Changes successfully written"
