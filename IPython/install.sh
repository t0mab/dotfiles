#! /bin/sh

mkdir -p $HOME/.ipython/profile_default

sudo pip install ipython
sudo pip3 install ipython

cp -v ipython_config.py $HOME/.ipython/profile_default
