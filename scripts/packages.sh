#! /bin/sh

sudo apt-get update -y

sudo apt-get dist-upgrade -y

sudo apt-get install -y\
	apt-file\
	aria2\
	aufs-tools\
	build-essential\
	bzr\
	ccache\
	curl\
	dos2unix\
	exif\
	exiv2\
	exuberant-ctags\
	fdupes\
	git\
	htop\
	ipython-notebook\
	ipython-qtconsole\
	ipython3\
	irssi-scripts\
	jpegoptim\
	lftp\
	libfreetype6-dev\
	libgdal-dev\
	libnet-dbus-perl\
	libnotify-bin\
	libpq-dev\
	libproj-dev\
	libxml2-dev\
	libxml2-utils \
	libxslt1-dev\
	lxc\
	lynis\
	mercurial\
	minicom\
	moreutils\
	ngrep\
	nmap\
	npm\
	pm-utils\
	postgresql-client\
	powertop\
	pv\
	pwgen\
	pyflakes\
	pylint\
	python-dev\
	python-doc\
	python-lxml\
	python-pip\
	python-setuptools\
	python-software-properties\
	rtmpdump\
	siege\
	ssh\
	sshuttle\
	task\
	texlive-lang-french\
	texlive-latex-extra\
	texlive\
	tidy\
	tmux\
	tsung\
	unattended-upgrades\
	vim\
	virtualenvwrapper\
	xml-twig-tools\
	xz-utils\
	zsh\

sudo apt-get autoremove -y

pip install --upgrade --user flake8
pip install --upgrade --user beets

sudo npm install -g coffee-script
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

fc-cache -vf ~/.fonts

go get -u github.com/nsf/gocode
go get -u github.com/jstemmer/gotags

[ "$DISPLAY" != ":0" ] && exit

sudo apt-get install -y\
	chromium-browser\
	default-jre\
	gimp\
	gitg\
	gitk\
	gource\
	indicator-multiload\
	inkscape\
	meld\
	scrot\
	ubuntu-restricted-extras\
	unetbootin\
	vlc\
	wallch\

sudo apt-get purge -y\
	apport\
	apport-gtk\
	evolution-data-server\
	gnome-bluetooth\
	gwibber\
	gwibber-service\
	indicator-messages\
	mdadm\
	python-apport\
	telepathy-indicator\
	unity-lens-shopping\
	unity-lens-video\
	unity-scope-musicstores\
	update-notifier\
	whoopsie\
