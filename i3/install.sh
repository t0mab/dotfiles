#! /bin/sh

set -e

sudo cp -v i3lock.service /etc/systemd/system
sudo systemctl enable i3lock.service

mkdir -p ~/.i3 ~/.config/i3status

cp -v gtkrc-2.0 ~/.gtkrc-2.0
cp -v i3_config ~/.i3/config
cp -v i3status_config ~/.config/i3status/config
cp -v xbindkeysrc ~/.xbindkeysrc
cp -v xinitrc ~/.xinitrc
cp -v Xresources ~/.Xresources
cp -v Xresources-light ~/.Xresources-light
