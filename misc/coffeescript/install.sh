#! /bin/sh

[ -f /usr/local/bin/node ] && sudo rm -fv /usr/local/bin/node
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

sudo npm install -g coffee-script
