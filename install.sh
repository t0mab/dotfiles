#! /bin/sh

set -e

ROOT=$(pwd)

for i in $(find . -name install.sh -depth 2 | sort); do
	directory=$(dirname $i)
	echo $directory
	cd $directory
	./install.sh
	cd $ROOT
done
