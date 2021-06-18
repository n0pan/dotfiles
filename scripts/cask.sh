#!/bin/sh

brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/cask-fonts

# Browsers
echo "Installing Browsers..."
brew cask install google-chrome
brew cask install firefox-developer-edition

# Development
echo "Installing Development..."
brew cask install visual-studio-code
brew cask install webstorm
brew cask install postman
brew cask install ngrok
brew cask install dash
brew cask install robo-3t
brew cask install docker
brew cask install resilio-sync

# Productivity
echo "Installing Productivity..."
brew cask install alfred
brew cask install contexts

# Communication
echo "Installing Communication..."
brew cask install slack
brew cask install teamviewer

# Terminal
echo "Installing Terminal"
brew cask install kitty

# Media
echo "Installing Media..."
brew cask install spotify
brew cask install transmission
brew cask install iina

# Tools
echo "Installing Tools..."
brew cask install bartender
brew cask install rocket
brew cask install authy

# Etc
echo "Installing fonts..."
brew cask install font-hack-nerd-font
brew cask install font-cascadia
brew cask install font-jetbrains-mono

cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/ 

echo "Cleanup..."
brew cask cleanup

echo "Installing App Store apps"
# Spark
mas install 1176895641
# Fantastical
mas install 975937182
# Things
mas install 904280696
# Flycut
mas install 442160987
# MindNode
mas install 1289197285
# Xcode
mas install 497799835

