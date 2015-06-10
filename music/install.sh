#! /bin/sh

set -e

mkdir -p ~/.config/beets
mkdir -p ~/.ncmpcpp

cp -v beets.yaml ~/.config/beets/config.yaml
cp -v mpd.conf ~/.mpdconf
cp -v ncmpcpp.conf ~/.ncmpcpp/config
