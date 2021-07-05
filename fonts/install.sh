echo "INSTALLING FONTS"
echo "----------------"
echo "1) Installing Pragamata Pro"
cp -R ~/dotfiles/fonts/Pragamata\ Pro/*.ttf /Library/Fonts
echo "Done!"
echo "2) Installing SF Mono"
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts/ 
echo "3) Installing fonts from cask"
brew install --cask font-hack-nerd-font
brew install --cask font-cascadia
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code-nerd-font

echo "Done!"
