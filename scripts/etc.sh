#!/bin/sh

# Install neovim
npm install neovim
pip3 install --user neovim

# Clone Ligaturizer
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules ~/Ligaturizer

# Install meteor
curl https://install.meteor.com/ | sh

# Clone Spicetify Theme
git clone https://github.com/morpheusthewhite/spicetify-themes.git ~/spicetify-themes

# Install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

cd ~/spicetify-themes
cp ./ ~/spicetify_data/Themes/

spicetify config current_theme Arc-Dark
spicetify backup apply
