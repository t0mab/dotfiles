# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lukerandall"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/.dotfiles/scripts:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=$PATH:$HOME/Scripts

DIRCOLORS_LIGHT=$(dircolors ~/.dircolors-solarized/dircolors.ansi-light)
DIRCOLORS_DARK=$(dircolors ~/.dircolors-solarized/dircolors.ansi-dark)

eval $DIRCOLORS_DARK

alias light='eval $DIRCOLORS_LIGHT && ~/.gnome-terminal-colors-solarized/set_light.sh'
alias dark='eval $DIRCOLORS_DARK && ~/.gnome-terminal-colors-solarized/set_dark.sh'

alias maj="sudo apt-get update && sudo apt-get dist-upgrade"

alias ta="tmux attach"

# Only load .Xmodmap if X server is running.
[ -n "${XAUTHORITY+x}" ] && xmodmap ~/.Xmodmap

# Fix Solarized theme in tmux session
alias tmux="TERM=screen-256color-bce tmux"

# Ignore HTTPS certificate by default with wget
alias wget="wget --no-check-certificate"

# Activate -O vim's option by default
alias vi="vim -O"

# Activate virtualenvwrapper
source /etc/bash_completion.d/virtualenvwrapper