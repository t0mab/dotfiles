#! /bin/sh

set -e

mkdir -p ~/.local/share/fonts

cp -v *.ttf ~/.local/share/fonts

fc-cache -vf ~/.local/share/fonts
