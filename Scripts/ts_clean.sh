#! /bin/bash

directory=$1

cd $directory

while read file; do
	echo $file
	unrar e "$file" && rm -rf "$(dirname "$file")"
done < <(find $directory -iname '*.rar' | egrep -i 's[0-9]{2}e[0-9]{2}')

while read file; do
	mv -v "$file" $directory && rm -rf "$(dirname "$file")"
done < <(find $directory -mindepth 2 -name '*.mkv' | egrep -i 's[0-9]{2}e[0-9]{2}')

cd -
