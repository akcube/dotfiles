#!/bin/zsh
set -eu

# Install non-essential packages I use frequently
echo "[1/3] Installing non-essential packages"
for pckg in `cat ne-pkglist.txt` 
do
    pamac install $pckg --no-confirm
done