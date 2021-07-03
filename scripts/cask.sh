!#/bin/sh

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Browsers
echo "Installing Browsers..."
brew install --cask google-chrome
brew install --cask firefox-developer-edition

# VM
echo "Installing VM..."
brew install --cask virtualbox

# VPN
echo "Installing VPN..."
brew install --cask private-internet-access

# Development
echo "Installing Development..."
brew install --cask visual-studio-code
brew install --cask webstorm
brew install --cask postman
brew install --cask ngrok
brew install --cask dash
brew install --cask robo-3t
brew install --cask docker
brew install --cask resilio-sync

# Productivity
echo "Installing Productivity..."
brew install --cask alfred
brew install --cask contexts

# Communication
echo "Installing Communication..."
brew install --cask slack
brew install --cask teamviewer

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

# Fonts
echo "Installing fonts..."
brew install --cask font-hack-nerd-font
brew install --cask font-cascadia
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code-nerd-font

cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/ 

cd ~/dotfiles/fonts/Pragamata Pro
cp *.ttf ~/Library.Fonts

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

