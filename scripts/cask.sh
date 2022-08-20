#!/bin/sh

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Browsers
echo "Installing Browsers..."
brew install --cask google-chrome
brew install --cask firefox-developer-edition

# Development
echo "Installing Development..."
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask ngrok
brew install --cask docker
brew install --cask android-studio

# Productivity
echo "Installing Productivity..."
brew install --cask alfred
brew install --cask contexts

# Terminal
echo "Installing Terminal..."
brew install --cask kitty

# Media
echo "Installing Media..."
brew install --cask spotify

# Tools
echo "Installing Tools..."
brew install --cask bartender
brew install --cask rocket
brew install --cask authy
brew install --cask fantastical
brew install --cask flycut

echo "Installing App Store apps"
# MindNode
mas install 1289197285
# Xcode
mas install 497799835
