#! /bin/sh

set -e

mkdir -p ~/.i3 ~/.config/i3status

cp -v gtkrc-2.0 ~/.gtkrc-2.0
cp -v i3_config ~/.i3/config
cp -v i3status_config ~/.config/i3status/config
cp -v xbindkeysrc ~/.xbindkeysrc
cp -v xinitrc ~/.xinitrc
cp -v Xresources ~/.Xresources
