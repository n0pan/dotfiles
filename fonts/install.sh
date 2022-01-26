#!/bin/bash

echo "Installing fonts"
echo "----------------"
echo "1) Installing SF Mono"
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts/ 
echo "3) Installing fonts from cask"
brew install --cask font-hack-nerd-font
brew install --cask font-cascadia
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code-nerd-font
brew install --cask font-iosevka

echo "Done!"
