#! /bin/bash

directory=$1

IFS=$'\n'
for filename in $(find $directory -iname '*.mkv' |  grep -iv /rome | grep -iv naruto | grep -iv vostfr); do
	[ -f "${filename%.*}.srt" ] && continue
	echo $filename
	subliminal -w 1 -l fr $filename
done
