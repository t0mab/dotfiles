#! /bin/sh

set -e

mkdir -p ~/.config/beets
mkdir -p ~/.ncmpcpp
mkdir -p ~/.config/mpd/logs
mkdir -p ~/.config/mpd/playlists

cp -v beets.yaml ~/.config/beets/config.yaml
cp -v mpd.conf ~/.mpdconf
cp -v ncmpcpp.conf ~/.ncmpcpp/config
