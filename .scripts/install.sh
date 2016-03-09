#! /bin/bash

set -e

echo "Installing and upgrading packages ..."
sudo pacman -Syu && sudo pacman --needed --noconfirm -S \
	abook \
	alsa-firmware \
	alsa-plugins \
	alsa-utils \
	aria2 \
	beets \
	bind-tools \
	brasero \
	chromium \
	compton \
	conky \
	cups \
	curl \
	darktable \
	dfc \
	dos2unix \
	dosfstools \
	dstat \
	evince \
	exfat-utils \
	fdupes \
	feh \
	firefox \
	fuse-exfat \
	gcc \
	gimp \
	git \
	go \
	gparted \
	gpicview \
	gptfdisk \
	hddtemp \
	htop \
	httpie \
	i3-wm \
	i3lock \
	i3status \
	imagemagick \
	inkscape \
	iotop \
	ipcalc \
	isync \
	jhead \
	jq \
	lftp \
	libcups \
	libreoffice \
	lsof \
	lxappearance \
	lynx \
	mesa-demos \
	moreutils \
	mpc \
	mpd \
	mpv \
	msmtp \
	mtr \
	mutt \
	ncdu \
	ncmpcpp \
	neovim \
	netctl \
	nethogs \
	nmap \
	notmuch \
	ntfs-3g \
	openssh \
	openvpn \
	p7zip \
	parallel \
	pass \
	pkgfile \
	postgresql \
	pulseaudio \
	pulseaudio-alsa \
	pv \
	python-pip \
	python-virtualenvwrapper \
	ranger \
	redshift \
	rsync \
	screenfetch \
	scrot \
	siege \
	slim \
	strace \
	syncthing \
	tcpdump \
	termite \
	testdisk \
	tmux \
	traceroute \
	transmission-gtk \
	ufw \
	unrar \
	wget \
	xbindkeys \
	xorg-server \
	xorg-server-utils \
	xorg-xinit \
	youtube-dl \
	zsh \

echo "Installing python packages ..."
pip install --user --upgrade neovim

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
