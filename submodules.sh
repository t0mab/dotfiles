#! /bin/sh

git submodule update --init --recursive
git submodule foreach git pull origin master
git submodule foreach 'git checkout $(git log --max-count=1 --pretty=format:"%H")'
git submodule sync

git commit -a -m 'Update submodules'
git push
