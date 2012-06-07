#! /bin/bash

backup_dir=~/NEF_Backups

mkdir -p $backup_dir

find /media -type f -name '*.NEF' | \
while read file; do
	filename=$(exiv2 pr "$file" | awk '/Image timestamp/ { print $4,$5}' | sed -e 's/ /_/' -e 's/://g').NEF
	cp -v "$file" $backup_dir/$filename
done
