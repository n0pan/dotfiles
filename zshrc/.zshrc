export TERM=xterm-256color

if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR='nvim'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Setting default_user
DEFAULT_USER=`whoami`

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize pip python brew osx zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=magenta"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias lf="find ./ -type f | grep "
alias st="sh start.sh"
alias st-ip="sh start-ip.sh"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias colorconfig="nvim ~/.config/nvim/colors"
alias tmuxconfig="nvim ~/.tmux.conf"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias yabairc="nvim ~/.yabairc"
alias skhdrc="nvim ~/.skhdrc"
alias vi="nvim"
alias al="nvim ~/.config/alacritty/alacritty.yml"
alias top="vtop"
alias discord="sh ~/scripts/discord.sh"
alias restore="sh ~/scripts/restore.sh"
alias cook-it="mux cook-it"
alias spotlyne="mux spotlyne"
alias ci-restore-db="docker start -a restore-test"
alias spt-restore-db="sh ~/dev/spotlyne/.config/dumpprod.sh"
alias new-ecom="tmux new-window -n ecom -c ~/dev/cookit-ecom"
alias new-api="tmux new-window -n api -c ~/dev/cookit-api"
alias new-admin="tmux new-window -n admin -c ~/dev/cookit-admin"
alias new-df="tmux new-window -n dotfiles -c ~/dotfiles"
alias new-spt="tmux new-window -n spotify spt"
alias new-top="tmux new-window -n top vtop"
alias new-utils="tmux new-window -n utils -c ~/dev/utils"
alias reload-spt="sudo launchctl stop /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl unload -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl load -w /Library/LaunchDaemons/rustlang.spotifyd.plist; sudo launchctl start /Library/LaunchDaemons/rustlang.spotifyd.plist"
alias reload-zsh="source ~/.zshrc"

hash -d ecom=~/DEV/cookit-ecom
hash -d api=~/DEV/cookit-api
hash -d admin=~/DEV/cookit-admin
hash -d ops=~/DEV/cookit-ops
hash -d spt=~/DEV/spotlyne
hash -d df=~/dotfiles
hash -d cdc=~/DEV/cockit-drinking-club

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
create_docker () {
 docker-machine create -d virtualbox --virtualbox-no-vtx-check "$1"
}

source ~/.bin/tmuxinator.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export PATH="/bin:$PATH"
export PATH="/usr/local/opt/docker-virtualbox/bin:$PATH"
