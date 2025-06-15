# Initial setup

1. [Ctrl + Q] in Hyprland to start a terminal
2. Use `nmtui` connect to the internet
3. Run `sudo pacman -Syyu` to force update all packages.
4. Next, run
```bash
sudo pacman -S --needed git base-devel 
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
5. Search and install brave, `paru -S brave-bin`
6. Install lastpass extension, login to GitHub, grab dotfiles. Auto-setup.
