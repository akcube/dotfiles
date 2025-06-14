#!/bin/bash

# Start script
echo "Applying asus kernel patch and installing asus tools..."

# Add asus-linux repo to pacman conf
echo "[1/3] Modify pacman.conf + system upgrade"

echo "
[g14]
SigLevel = DatabaseNever Optional TrustAll
Server = https://arch.asus-linux.org
" >> /etc/pacman.conf
pacman -Syu --noconfirm --needed

# Install asus tools
echo "[2/3] Installing asusctl & supergfxctl"
pacman -S asusctl --noconfirm --needed
systemctl enable --now power-profiles-daemon.service
pacman -S supergfxctl --noconfirm --needed
systemctl enable --now supergfxd

# Apply kernel patch
echo "[3/3] Patching kernel"
pacman -Sy linux-g14 linux-g14-headers --noconfirm --needed
grub-mkconfig -o /boot/grub/grub.cfg

# Force restart to apply changes
echo "Restart to apply changes. Powering off in 5..."
sleep 1 && echo "4..."
sleep 1 && echo "3..."
sleep 1 && echo "2..."
sleep 1 && echo "1..."
sleep 1 && echo "Now."
reboot
