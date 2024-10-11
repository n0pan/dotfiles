#!/bin/sh

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

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
brew install --cask docker

# Productivity
echo "Installing Productivity..."
brew install --cask alfred
brew install --cask contexts
brew install --cask bitwarden

# Communication
echo "Installing Communication..."
brew install --cask slack
brew install --cask whatsapp

# Terminal
echo "Installing Terminal..."
brew install --cask kitty

# Media
echo "Installing Media..."
brew install --cask spotify
brew install --cask transmission
brew install --cask iina

# Tools
echo "Installing Tools..."
brew install --cask bartender
brew install --cask rocket
brew install --cask authy
brew install --cask fantastical
brew install --cask flycut
brew install --cask betterdisplay

echo "Installing App Store apps"
# MindNode
mas install 1289197285
# Xcode
mas install 497799835
