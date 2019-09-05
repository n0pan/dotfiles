#!/bin/sh

# Install neovim
npm install neovim
pip3 install --user neovim

# Clone Ligaturizer
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules
