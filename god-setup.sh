#!/bin/bash
set -eu

# Define the path to your packages.txt file
PACKAGES_FILE="./packages.txt"

# Check if the packages.txt file exists
if [[ ! -f "$PACKAGES_FILE" ]]; then
  echo "Error: $PACKAGES_FILE not found."
  exit 1
fi

# Start script
echo "Starting general setup..."

# Install essential packages
echo "[1/5] Installing essential packages..."

# First, let's separate official packages from AUR packages for better handling
echo "Installing official repository packages..."
# Install official repo packages first (these are more reliable)
# paru --noconfirm --needed -S - < "$PACKAGES_FILE"

# Install Oh My Zsh (only if not already installed)
echo "[2/5] Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed, skipping..."
fi

# Install Starship prompt
echo "[3/5] Installing Starship..."
paru --noconfirm --needed -S starship

# Configure Starship prompt
echo "[4/5] Configuring Starship prompt..."
mkdir -p ~/.config
if [[ ! -f ~/.config/starship.toml ]]; then
    echo "No existing starship.toml found. You can add your custom configuration manually."
    echo "Starship will use default configuration for now."
else
    echo "Existing starship.toml found, keeping your custom configuration."
fi

# Set Zsh as default shell (only if not already set)
ZSH_PATH="$(which zsh)"
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
    echo "Setting Zsh as default shell..."
    
    # Check if zsh path is in /etc/shells
    if ! grep -q "^$ZSH_PATH$" /etc/shells; then
        echo "Adding $ZSH_PATH to /etc/shells..."
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    
    # Now change the shell
    sudo chsh -s "$ZSH_PATH" "$USER"
    echo "Shell changed to zsh. You'll need to log out and back in for this to take effect."
else
    echo "Zsh is already the default shell"
fi

# Install Zsh plugins
echo "[5/5] Installing Zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-autosuggestions
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting already installed"
fi

# End script
echo "Setup complete. Please restart your terminal."
