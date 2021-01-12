#!/bin/sh

echo "installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "installing neovim..."
npm install neovim
pip2 install pynvim
pip3 install pynvim

echo "install ligaturizer..."
git clone https://github.com/ToxicFrog/Ligaturizer.git --recurse-submodules ~/Ligaturizer

echo "install meteor..."
curl https://install.meteor.com/ | sh

echo "install powerlevel10k..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "install tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "copy .config"
cp -R ~/dotfiles/.config/ ~/.config/

echo "copy .bin"
cp -R ~/dotfiles/.bin/ ~/.bin/

echo "create spotifyd daemon"
sudo cp ~/dotfiles/Library/LaunchDaemons/rustlang.spotifyd.plist /Library/LaunchDaemons/rustlang.spotifyd.plist
sudo launchctl load -w /Library/LaunchDaemons/rustlang.spotifyd.plist
sudo launchctl start /Library/LaunchDaemons/rustlang.spotifyd.plist

echo "beautifuldiscord"
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip
beautifuldiscord --css ~/.config/discord/theme./css
