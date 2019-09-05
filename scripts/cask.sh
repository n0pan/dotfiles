#!/bin/sh

brew tap caskroom/cask
brew tap caskroom/versions

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

# Tools
echo "Installing Tools..."
brew cask install bartender
brew cask install divvy
brew cask install rocket

# Etc
echo "Installing fonts..."
brew cask install font-hack-nerd-font

# App Store apps
echo "Installing App Store apps"
mas Spark, id: 1176895641
mas Fantastical 2, id: 975937182
mas Things 3, id: 904280696
mas Flycut, id: 442160987

