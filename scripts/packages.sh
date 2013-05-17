#! /bin/sh

sudo apt-get update -y

sudo apt-get dist-upgrade -y

sudo apt-get install -y\
	apt-file\
	aria2\
	build-essential\
	ccache\
	curl\
	dos2unix\
	exif\
	exiv2\
	exuberant-ctags\
	fdupes\
	ghc\
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
	libxslt1-dev\
	lynis\
	mercurial\
	moreutils\
	ngrep\
	nmap\
	npm\
	postgresql-client\
	pv\
	pwgen\
	pyflakes\
	pylint\
	python-dev\
	python-doc\
	python-lxml\
	python-matplotlib\
	python-numpy\
	python-pip\
	python-scipy\
	python-setuptools\
	python-software-properties\
	rtmpdump\
	siege\
	ssh\
	sshuttle\
	texlive-lang-french\
	texlive-latex-extra\
	texlive\
	tidy\
	tmux\
	tsung\
	ufraw-batch\
	unattended-upgrades\
	vim\
	virtualenvwrapper\
	xml-twig-tools\
	xz-utils\
	zsh\

sudo apt-get autoremove -y

sudo pip install --upgrade flake8

sudo npm install -g coffee-script
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

[ "$DISPLAY" != ":0" ] && exit

sudo apt-get install -y\
	chromium-browser\
	default-jre\
	gimp\
	gitg\
	gitk\
	gource\
	indicator-multiload\
	indicator-weather\
	inkscape\
	meld\
	rdesktop\
	scrot\
	ubuntu-restricted-extras\
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
	update-notifier\
	whoopsie\
