#! /usr/bin/env bash

. ../../helpers.sh

cp -v zshrc ~/.zshrc
cp -v zshenv ~/.zshenv

git_clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git_clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized
