#! /bin/bash

set -e

echo "Installing and upgrading packages ..."
sudo pacman -Syu && sudo pacman --needed --noconfirm -S \
	abook \
	aria2 \
	beets \
	compton \
	curl \
	dfc \
	dos2unix \
	fdupes \
	git \
	go \
	i3-wm \
	i3lock \
	i3status \
	imagemagick \
	ipcalc \
	isync \
	jhead \
	jq \
	lftp \
	mpc \
	mpd \
	msmtp \
	mtr \
	mutt \
	ncdu \
	ncmpcpp \
	neovim \
	nmap \
	notmuch \
	p7zip \
	parallel \
	pass \
	postgresql \
	pv \
	ranger \
	redshift \
	screenfetch \
	scrot \
	siege \
	slim \
	syncthing \
	termite \
	testdisk \
	tmux \
	unrar \
	wget \
	xbindkeys \
	youtube-dl \
	zsh \

echo "Enable and start syncthing ..."
sudo systemctl enable syncthing@fabien
sudo systemctl start syncthing@fabien

echo "Updating fonts cache ..."
fc-cache -f ~/.local/share/fonts

export GOPATH="$HOME/Go"

GO_REPOS="\
	github.com/golang/lint/golint \
	github.com/jstemmer/gotags \
	github.com/kisielk/errcheck \
	github.com/lib/pq \
	github.com/nsf/gocode \
	github.com/rogpeppe/godef \
	github.com/tsenart/vegeta \
	golang.org/x/tools/cmd/benchcmp \
	golang.org/x/tools/cmd/goimports \
	golang.org/x/tools/cmd/gorename \
	golang.org/x/tools/cmd/vet \
	golang.org/x/tools/oracle \
"

# GO_REPOS=""

for repos in $GO_REPOS; do
	echo "Installing $repos ..."
	go get -u $repos
done

echo "Install vegeta binary ..."
go install github.com/tsenart/vegeta
