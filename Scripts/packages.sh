#! /bin/sh

sudo apt-get install $(cat ~/.packages | xargs)
