define packages::common() {
	package { 'apt-file': ensure => present }
	package { 'aria2': ensure => present }
	package { 'curl': ensure => present }
	package { 'fdupes': ensure => present }
	package { 'htop': ensure => present }
	package { 'jpegoptim': ensure => present }
	package { 'lftp': ensure => present }
	package { 'moreutils': ensure => present }
	package { 'ngrep': ensure => present }
	package { 'nmap': ensure => present }
	package { 'pv': ensure => present }
	package { 'pwgen': ensure => present }
	package { 'rtmpdump': ensure => present }
	package { 'siege': ensure => present }
	package { 'ssh': ensure => present }
	package { 'sshuttle': ensure => present }
	package { 'tmux': ensure => present }
	package { 'tsung': ensure => present }
	package { 'xz-utils': ensure => present }
}

define packages::dev() {
	package { 'build-essential': ensure => present }
	package { 'exuberant-ctags': ensure => present }
	package { 'git': ensure => present }
	package { 'ipython-notebook': ensure => present }
	package { 'ipython-qtconsole': ensure => present }
	package { 'ipython3': ensure => present }
	package { 'libfreetype6-dev': ensure => present }
	package { 'libgdal-dev': ensure => present }
	package { 'libpq-dev': ensure => present }
	package { 'libproj-dev': ensure => present }
	package { 'libxml2-dev': ensure => present }
	package { 'libxslt1-dev': ensure => present }
	package { 'octave': ensure => present }
	package { 'postgresql-client': ensure => present }
	package { 'pyflakes': ensure => present }
	package { 'pylint': ensure => present }
	package { 'python-dev': ensure => present }
	package { 'python-doc': ensure => present }
	package { 'python-lxml': ensure => present }
	package { 'python-matplotlib': ensure => present }
	package { 'python-numpy': ensure => present }
	package { 'python-pip': ensure => present }
	package { 'python-scipy': ensure => present }
	package { 'python-setuptools': ensure => present }
	package { 'python3-pip': ensure => present }
	package { 'r-base': ensure => present }
	package { 'tidy': ensure => present }
	package { 'xml-twig-tools': ensure => present }
}

define packages::desktop() {
	package { 'chromium-browser': ensure => present }
	package { 'default-jre': ensure => present }
	package { 'gimp': ensure => present }
	package { 'gitg': ensure => present }
	package { 'gource': ensure => present }
	package { 'indicator-multiload': ensure => present }
	package { 'indicator-weather': ensure => present }
	package { 'inkscape': ensure => present }
	package { 'rdesktop': ensure => present }
	package { 'ubuntu-restricted-extras': ensure => present }
	package { 'vlc': ensure => present }
	package { 'wallch': ensure => present }
}

define packages::photography() {
	package { 'exif': ensure => present }
	package { 'exiv2': ensure => present }
	package { 'hugin': ensure => present }
	package { 'ufraw-batch': ensure => present }
}

define packages::tex() {
	package { 'texlive': ensure => present }
	package { 'texlive-lang-french': ensure => present }
	package { 'texlive-latex-extra': ensure => present }
}

define packages::clean() {
	package { 'python-apport': ensure => purged }
	package { 'whoopsie': ensure => purged }
}
