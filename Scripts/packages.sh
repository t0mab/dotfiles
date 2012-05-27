#! /bin/bash

sudo apt-get install $(cat ~/.packages | xargs)

[ "$SHELL" == "/usr/bin/zsh" ] && rehash
