#! /bin/sh

if [ ! -f /usr/bin/salt-call ]; then
	sudo apt-get install -y python-software-properties
	sudo add-apt-repository -y ppa:saltstack/salt
	sudo apt-get install -y salt-minion
fi

sudo salt-call state.highstate --local
