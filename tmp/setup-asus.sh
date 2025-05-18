#!/bin/bash

# Start script
echo "Applying asus kernel patch and installing asus tools..."

# Add asus-linux repo to pacman conf
echo "[1/4] Modify pacman.conf + system upgrade"

pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

echo "
[g14]
SigLevel = DatabaseNever Optional TrustAll
Server = https://arch.asus-linux.org
" >> /etc/pacman.conf

sudo pacman -Syu --noconfirm --needed

# Install asus tools
echo "[2/4] Installing asusctl, supergfxctl & rog-centre"

pacman -S asusctl --noconfirm --needed
systemctl enable --now power-profiles-daemon.service

pacman -S supergfxctl --noconfirm --needed
systemctl enable --now supergfxd

pacman -S rog-control-center --noconfirm --needed

# Apply kernel patch
echo "[3/4] Patching kernel"

pacman -Sy linux-g14 linux-g14-headers --noconfirm --needed
grub-mkconfig -o /boot/grub/grub.cfg

# Fix ethernet driver issues
echo "[4/4] Fixing ethernet driver issue by rolling back from r8169 to r8168"
paru -Sy --noconfirm --needed r8168-dkms 
modprobe -r r8169
modprobe r8168

# Force restart to apply changes
echo "Restart to apply changes. Powering off in 5..."
sleep 1 && echo "4..."
sleep 1 && echo "3..."
sleep 1 && echo "2..."
sleep 1 && echo "1..."
sleep 1 && echo "Now."

