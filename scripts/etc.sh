#!/bin/sh

echo "installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "installing neovim..."
npm install neovim
pip2 install pynvim
pip3 install pynvim

echo "install meteor..."
curl https://install.meteor.com/ | sh

echo "install powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH/themes/powerlevel10k

echo "install tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "copy .config"
cp -R ~/dotfiles/.config/ ~/.config/

echo "create spotifyd daemon"
sudo cp ~/dotfiles/spotifyd/rustlang.spotifyd.plist /Library/LaunchDaemons/rustlang.spotifyd.plist
sudo launchctl load -w /Library/LaunchDaemons/rustlang.spotifyd.plist
sudo launchctl start /Library/LaunchDaemons/rustlang.spotifyd.plist

echo "beautifuldiscord"
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip
beautifuldiscord --css ~/.config/discord/theme./css
