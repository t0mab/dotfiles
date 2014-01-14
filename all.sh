#! /bin/sh

ROOT=$(pwd)

for i in $(find . -name install.sh | grep -v packages | sort); do
	echo $i
	cd $(dirname $i)
	./install.sh
	cd $ROOT
done
