#!/bin/bash

set -e

current_year=$(date +%Y)

backup_dir="$HOME/Sync/Photos/Perso"

for p in $(find ~/.iphone/DCIM -name '*.JPG'); do
	dst=$(exiv2 pr -q -g Exif.Image.DateTime $p | awk '{ print $4 "-" $5}' | tr -d ':')

	# Ignore photos without datetime
	([ -z $dst ]  || [ "$dst" == "-" ]) && continue

	year=${dst:0:4}

	dst_dir="$backup_dir/$year"
	mkdir -v -p $dst_dir

	dst="$dst_dir/$dst.jpg"
	[ ! -f $dst ] && cp -v $p $dst
done

find ~/.iphone/DCIM -name '*.MOV' -exec rsync -v --progress --modify-window=2 --times --update {} "$HOME/Sync/Videos/Perso/" \;
