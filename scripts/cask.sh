#!/bin/sh

# Browsers
echo "Installing Browsers..."
brew install --cask arc
brew install --cask firefox-developer-edition

# VPN
echo "Installing VPN..."
brew install --cask private-internet-access

# Development
echo "Installing Development..."
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask ngrok
brew install --cask dash
brew install --cask docker-desktop

# Productivity
echo "Installing Productivity..."
brew install --cask alfred
brew install --cask contexts
brew install --cask bitwarden
brew install --cask rectangle

# Communication
echo "Installing Communication..."
brew install --cask slack
brew install --cask whatsapp
brew install --cask signal

# Terminal
echo "Installing Terminal..."
brew install --cask kitty

# Media
echo "Installing Media..."
brew install --cask spotify
brew install --cask transmission
brew install --cask iina
brew install --cask plex

# Menu bar
# note: all three are installed locally; bartender is the incumbent and
# ice/thaw are the trial replacements. Prune once one of them wins.
echo "Installing menu bar tools..."
brew install --cask bartender
brew install --cask jordanbaird-ice
brew install --cask thaw

# Tools
echo "Installing Tools..."
brew install --cask rocket
brew install --cask flycut
brew install --cask betterdisplay
brew install --cask bettermouse

echo "Installing App Store apps"
mas install 1289197285  # MindNode
mas install 975937182   # Fantastical
mas install 966085870   # TickTick
mas install 1176895641  # Spark
mas install 1614666244  # Mattermost
mas install 1440147259  # AdGuard Mini
mas install 6738622779  # Readest
