if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=screen-256color
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export NPM_TOKEN=507ec72962febbc34db630042b282e145a538bbe

ZSH_THEME="powerlevel10k/powerlevel10k"

# Setting default_user
DEFAULT_USER=`whoami`

plugins=(
  git 
  colored-man-pages 
  colorize 
  pip 
  brew 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=204"

# aliases
alias st="sh start.sh"
alias zshrc="nvim ~/.zshrc"
alias viconf="nvim ~/.config/nvim/init.lua"
alias colorconf="nvim ~/.config/nvim/colors"
alias tmuxconf="nvim ~/.tmux.conf"
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias yabairc="nvim ~/.yabairc"
alias skhdrc="nvim ~/.skhdrc"
alias vi="nvim"
alias vim="nvim"
alias top="vtop"
alias discord="sh ~/scripts/discord.sh"
alias ci-restore-db="docker start -a restore-test"
alias spt-restore-db="sh ~/dev/spotlyne/.config/dumpprod.sh"
alias new-ecom="tmux new-window -n ecom -c ~/dev/cookit/cookit-ecom"
alias new-controllers="tmux new-window -n controllers -c ~/dev/cookit/cookit-ecom-controllers"
alias new-ui="tmux new-window -n ui -c ~/dev/cookit/cookit-ui"
alias new-api="tmux new-window -n api -c ~/dev/cookit/cookit-api"
alias new-admin="tmux new-window -n admin -c ~/dev/cookit/cookit-admin"
alias new-df="tmux new-window -n dotfiles -c ~/dotfiles"
alias new-spt="tmux new-window -n spotify spt"
alias new-top="tmux new-window -n top vtop"
alias new-utils="tmux new-window -n utils -c ~/dev/cookit/utils"
alias reload-spt="sudo launchctl stop /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl unload -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl load -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl start /Library/LaunchDaemons/rustlang.spotifyd.plist"
alias reload-zsh="source ~/.zshrc"
alias restart-yabai="brew services restart yabai"
alias restart-skhd="brew services restart skhd"

hash -d lq=~/dev/long-quan
hash -d ci=~/dev/cookit
hash -d ecom=~/dev/cookit/cookit-ecom
hash -d ui=~/dev/cookit/cookit-ui
hash -d api=~/dev/cookit/cookit-api
hash -d admin=~/dev/cookit/cookit-admin
hash -d controllers=~/dev/cookit/cookit-ecom-controllers
hash -d ops=~/dev/cookit/cookit-ops
hash -d utils=~/dev/cookit/utils
hash -d spt=~/dev/spotlyne
hash -d df=~/dotfiles
hash -d cdc=~/dev/cockit-drinking-club

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
create_docker () {
 docker-machine create -d virtualbox --virtualbox-no-vtx-check "$1"
}

# cook it utility functions
lc() {
  # install controller packages, build controllers & create link
  echo "LINKING COOKIT-ECOM-CONTROLLERS"
  echo "-------------------------------"
  echo "1) Re-installing controller dependencies"
  rm -rf ~/dev/cookit/cookit-ecom-controllers/node_modules
  cd ~/dev/cookit/cookit-ecom-controllers
  yarn install
  echo "2) Generating queries"
  yarn gen
  echo "3) Building controllers"
  yarn build
  echo "4) Creating @chefcookit/cookit-ecom-controllers link..."
  yarn link
  cd ~/dev/cookit/cookit-ecom
  echo "5) Linking..."
  yarn link @chefcookit/cookit-ecom-controllers
  echo "Done!"
}

lutils() {
  echo "LINKING COOKIT-UTILS"
  echo "-------------------"
  echo "1) creating link"
  cd ~/dev/cookit/utils/
  npm link
  echo "2) linking ecom"
  cd ~/dev/cookit/cookit-ecom/
  npm link @chefcookit/utils
  echo "3) linking api"
  cd ~/dev/cookit/cookit-api/
  npm link @chefcookit/utils
  echo "4) linking admin"
  cd ~/dev/cookit/cookit-admin/
  npm link @chefcookit/utils
}

lr() {
  # delete react node_modules && create link
  echo "LINKING REACT BETWEEN COOKIT-UI, COOKIT-ECOM-CONTROLLERS AND COOKIT-ECOM"
  echo "------------------------------------------------------------------------"
  echo "1) Removing @cookit-ui/node_modules/react"
  rm -rf ~/dev/cookit/cookit-ui/node_modules/react
  cd ~/dev/cookit/cookit-ecom/node_modules/react
  echo "2) Creating React link"
  yarn link
  cd ~/dev/cookit/cookit-ui
  echo "3) Linking..."
  yarn link react
  echo "4) Removing @cookit-ecom-controllers/node_modules/react"
  rm -rf ~/dev/cookit/cookit-ecom-controllers/node_modules/react
  cd ~/dev/cookit/cookit-ecom-controllers
  echo "5) Linking..."
  yarn link react
  echo "Done!"
}

lui() {
  echo "LINKING COOKIT-UI AND COOKIT-ECOM"
  echo "---------------------------------"
  echo "1) Creating @chefcookit/cookit-ui link"
  cd ~/dev/cookit/cookit-ui
  yarn link
  cd ~/dev/cookit/cookit-ecom
  yarn link @chefcookit/cookit-ui
  echo "Done!"
}

rebuild-ctrl() {
  cd ~controllers
  yarn gen && yarn build
  cd ~ecom
}

reset-v4() {
  cd ~ecom
  echo "Removing node_modules"
  rm -rf ~/dev/cookit/cookit-ecom/node_modules
  rm -rf ~/dev/cookit/cookit-ecom-controllers/node_modules
  meteor npm i
  lc
  lui
  lr
  cd ~ecom
}

# TMATE Functions

TMATE_PAIR_NAME="$(whoami)-pair"
TMATE_SOCKET_LOCATION="/tmp/tmate-pair.sock"
TMATE_TMUX_SESSION="/tmp/tmate-tmux-session"

# Get current tmate connection url
tmate-url() {
  url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
  echo "$url" | tr -d '\n' | pbcopy
  echo "Copied tmate url for $TMATE_PAIR_NAME:"
  echo "$url"
}

# Start a new tmate pair session if one doesn't already exist
# If creating a new session, the first argument can be an existing TMUX session to connect to automatically
tmate-pair() {
  if [ ! -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" -f "$HOME/.tmate.conf" new-session -d -s "$TMATE_PAIR_NAME"

    while [ -z "$url" ]; do
      url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
    done
    tmate-url
    sleep 1

    if [ -n "$1" ]; then
      echo $1 > $TMATE_TMUX_SESSION
      tmate -S "$TMATE_SOCKET_LOCATION" send -t "$TMATE_PAIR_NAME" "TMUX='' tmux attach-session -t $1" ENTER
    fi
  fi
  tmate -S "$TMATE_SOCKET_LOCATION" attach-session -t "$TMATE_PAIR_NAME"
}

# Close the pair because security
tmate-unpair() {
  if [ -e "$TMATE_SOCKET_LOCATION" ]; then
    if [ -e "$TMATE_SOCKET_LOCATION" ]; then
      tmux detach -s $(cat $TMATE_TMUX_SESSION)
      rm -f $TMATE_TMUX_SESSION
    fi

    tmate -S "$TMATE_SOCKET_LOCATION" kill-session -t "$TMATE_PAIR_NAME"
    echo "Killed session $TMATE_PAIR_NAME"
  else
    echo "Session already killed"
  fi
}

source ~/.bin/tmuxinator.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export PATH="/bin:$PATH"
export PATH="/usr/local/opt/docker-virtualbox/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/terminal/.p10k.zsh.
[[ ! -f ~/dotfiles/terminal/.p10k.zsh ]] || source ~/dotfiles/terminal/.p10k.zsh
