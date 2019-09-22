#!/bin/sh

brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/cask-fonts

# Browsers
echo "Installing Browsers..."
brew cask install google-chrome
brew cask install firefox

# Development
echo "Installing Development..."
brew cask install visual-studio-code
brew cask install webstorm
brew cask install postman
brew cask install ngrok
brew cask install dash
brew cask install robo-3t

# Productivity
echo "Installing Productivity..."
brew cask install alfred
brew cask install contexts

# Communication
echo "Installing Communication..."
brew cask install slack
brew cask install teamviewer

# Terminal
echo "Installing iTerm2 Nightly"
brew cask install iterm2-nightly

# Media
echo "Installing Media..."
brew cask install spotify
brew cask install transmission
brew cask install iina

# Tools
echo "Installing Tools..."
brew cask install bartender
brew cask install amethyst
brew cask install rocket

# Etc
echo "Installing fonts..."
brew cask install font-hack-nerd-font
brew cask install font-cascadia

# App Store apps
echo "Installing App Store apps"
mas Spark, id: 1176895641
mas Fantastical 2, id: 975937182
mas Things 3, id: 904280696
mas Flycut, id: 442160987
mas MindNode 6, id: 1289197285

