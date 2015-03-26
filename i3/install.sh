#! /bin/sh

set -e

sudo cp -v i3lock.service /etc/systemd/system
sudo systemctl enable i3lock.service

mkdir -p ~/.i3 ~/.config/i3status

cp -v gtkrc-2.0 ~/.gtkrc-2.0
cp -v i3_config ~/.i3/config
cp -v xbindkeysrc ~/.xbindkeysrc
cp -v xinitrc ~/.xinitrc
cp -v Xresources ~/.Xresources
cp -v Xresources-dark ~/.Xresources-dark
cp -v Xresources-light ~/.Xresources-light
cp -v conky* ~/.i3

if lspci | grep -q Apple; then
	echo "Xft.dpi: 140" >> ~/.Xresources
	sed -i -e 's/Mod1/Mod4/' -e 's/Ubuntu 10/Ubuntu 14/' ~/.i3/config
fi
