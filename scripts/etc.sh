#!/bin/sh

# Install neovim
npm install neovim
pip3 install --user neovim

# Clone Ligaturizer
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules

# Install meteor
curl https://install.meteor.com/ | sh

# Clone Spicetify Theme
git clone https://github.com/morpheusthewhite/spicetify-themes.git ~/spicetify-themes

cd ~/spicetify-themes
cp ./ ~/spicetify_data/Themes/

spicetify config current_theme Arc-Dark
spicetify backup apply
