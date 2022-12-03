if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="no-cursor"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

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
alias vicolor="nvim ~/.config/nvim/lua/settings/colorscheme.lua"
alias colorconf="nvim ~/.config/nvim/colors"
alias tmuxconf="nvim ~/.tmux.conf"
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias yabairc="nvim ~/.yabairc"
alias skhdrc="nvim ~/.skhdrc"
alias vi="nvim"
alias vim="nvim"
alias top="vtop"
alias new-df="tmux new-window -n dotfiles -c ~/dotfiles"
alias new-spt="tmux new-window -n spotify spt"
alias new-top="tmux new-window -n top vtop"
alias reload-spt="sudo launchctl stop /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl unload -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl load -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl start /Library/LaunchDaemons/rustlang.spotifyd.plist"
alias reload-zsh="source ~/.zshrc"
alias restart-yabai="brew services restart yabai"
alias restart-skhd="brew services restart skhd"
alias gl="glab"

hash -d lq=~/dev/long-quan
hash -d df=~/dotfiles
hash -d vi=~/dotfiles/neovim
hash -d cdc=~/dev/cdc
hash -d hmi=~/dev/taiga/hmi
hash -d taiga=~/dev/taiga
hash -d cashflow=~/dev/cashflow

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
create_docker () {
 docker-machine create -d virtualbox --virtualbox-no-vtx-check "$1"
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
