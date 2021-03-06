# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
#setopt share_history # share command history data

# Term
export TERM=xterm

# Go
export GOPATH=~/Go
export PATH="$HOME/go/bin:$GOPATH/bin:$PATH"

# Local pip binaries
export PATH="$HOME/.local/bin:$PATH"

# SSH
SSH_ENV="$HOME/.ssh/env"

function start-ssh-agent {
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV
	chmod 600 $SSH_ENV
	. $SSH_ENV > /dev/null
	/usr/bin/ssh-add
}

if [ -f $SSH_ENV ]; then
	. $SSH_ENV > /dev/null
	ps $SSH_AGENT_PID | grep -q ssh-agent || start-ssh-agent
else
	start-ssh-agent
fi

# Tab completion
autoload -U compinit
compinit
setopt completealiases
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
unsetopt CASE_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Neovim as default editor
alias vi=nvim
alias vim=nvim
export EDITOR=nvim

# Vi mode
bindkey -v
export KEYTIMEOUT=1

autoload -U colors
colors

function git-prompt-status {
	local BRANCH INDEX STATUS
	local UNTRACKED="%%"
	local ADDED="+"
	local MODIFIED="*"
	local RENAMED="~"
	local DELETED="!"
	local UNMERGED="?"
	INDEX=$(command git status --porcelain -b 2> /dev/null)

	[[ -z $INDEX ]] && return

	BRANCH=$(echo "$INDEX" | command head -n 1 | command cut -d' ' -f2-)
	STATUS=""
	if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
		STATUS="$UNTRACKED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
		STATUS="$ADDED$STATUS"
	elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
		STATUS="$ADDED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
		STATUS="$MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
		STATUS="$MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
		STATUS="$MODIFIED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
		STATUS="$RENAMED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
		STATUS="$DELETED$STATUS"
	elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
		STATUS="$DELETED$STATUS"
	elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
		STATUS="$DELETED$STATUS"
	fi
	if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
		STATUS="$STASHED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
		STATUS="$UNMERGED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
		STATUS="$AHEAD$STATUS"
	fi
	if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
		STATUS="$BEHIND$STATUS"
	fi
	if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null); then
		STATUS="$DIVERGED$STATUS"
	fi
	[[ -z $STATUS ]] && echo "$BRANCH" || echo "$BRANCH $STATUS"
}

function zle-line-init zle-keymap-select {
	VIMODE="${${KEYMAP/vicmd/$fg_bold[red]%B»%b$reset_color}/(main|viins)/%B»%b}"
	GIT_STATUS="$(git-prompt-status)"
	[[ -n $GIT_STATUS ]] && GIT_STATUS=" %{$fg[yellow]%}($GIT_STATUS)%{$reset_color%}"
	PROMPT="%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%}$GIT_STATUS ${VIMODE} "
	zle reset-prompt
}

setopt promptsubst

bindkey '^r' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

zle -N zle-line-init
zle -N zle-keymap-select

# Enable ls colors, disable escaping, show directories first
alias ls="ls --group-directories-first --color=tty --quoting-style=literal"

# Launch a small webserver
alias ws="python -m SimpleHTTPServer"

# NPR Radio
alias npr="mplayer http://nprdmp.ic.llnwd.net/stream/nprdmp_live01_mp3"

# Display the whole year with monday as first day and week numbers
alias cal="cal -m -3 -y -w"

# Change the current wallpaper by picking up a random one
alias chwall="[[ -d ~/Sync/Wallpapers ]] && feh --randomize --bg-fill ~/Sync/Wallpapers/*"

# Only play audio on video files
alias listen_video="mplayer -novideo"

# Pretty JSON
alias pretty_json="python -m json.tool"

# ... with colors
alias pretty_json_colorized="pretty_json | pygmentize -l javascript"

# Watch disk flushing
alias watch_flush="watch grep -e Dirty: -e Writeback: /proc/meminfo"

# Beet import current directory
alias bi.="beet import ."

# To manage dotfiles via git worktree
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Shorter version of dotfiles
alias d="dotfiles"

# Let's upgrade the system
alias upgrade="sudo pacman -Sy && pacman -Qui | grep -e '^Name' -e 'Version' -e '^Install Reason' -e 'Required By' | grep -C 10 --color '^Name.*' && sudo pacman -Su"

# git is too long to type ... ^_^
alias g="git"

# Move to Go projects directory
alias goprojects="cd ~/Go/src/github.com/fabienengels"

# Hope that'll help me to sleep ...
alias redshift-strasbourg="redshift -v -l 48.57:7.75 -b 1.0:0.6"

# List listening services
alias listening="lsof -i TCP -i UDP -n -P | grep LISTEN"

# Delete all Docker containers and images
alias purge_docker="docker ps -qa | xargs docker rm -f ; docker images -qa | xargs docker rmi -f"

# Generate a secure password
alias genpasswd="pwgen -Bcy 15 1"

# Gparted as root
alias gparted="sudo gparted"

# Test servers
alias run_mongodb26="docker run -it --rm -p 27017:27017 mongo:2.6"

# Launch Jupyter server
alias notebook="jupyter-notebook --no-browser --no-mathjax"

# Send Json POST request
alias post_json="curl -X POST --header 'Content-Type: application/json' -d"

# Launch a test RabbitMQ container
alias docker_rabbitmq="docker run -it --rm -p 5672:5672 -p 15672:15672 rabbitmq:management-alpine"
alias docker_redis="docker run -it --rm -p 6379:6379 redis:alpine"

function postgres_get_last_backup {
  scp 10.0.0.13:/backups/postgresql/$1/$1-$(date +%d).dump $1.dump
}

function postgres_get_port {
  docker inspect postgres_$1 | jq -M -r  '.[0].NetworkSettings.Ports."5432/tcp"[0].HostPort'
}

function postgres_launch {
  docker run -it --rm --name postgres_$1 -e POSTGRES_USER=$1 -v $HOME/Databases/$1:/var/lib/postgresql/data -p $2:5432 postgres:9.6
}

function postgres_psql {
  psql -h localhost -U $1 -p $(postgres_get_port $1)
}

function postgres_restore {
  pg_restore -d $1 -j $(grep -c processor /proc/cpuinfo) -O -x -h localhost -p $(postgres_get_port $1) -U $1 $1.dump
}
