#! /usr/bin/env bash

. ../helpers.sh

sudo pip install --upgrade flake8

cp -v vimrc ~/.vimrc

[ ! -d ~/.vim-tmp ] && mkdir ~/.vim-tmp
[ ! -d ~/.vim/templates ] && mkdir -p ~/.vim/templates

cp -v python.py ~/.vim/templates

#rsync --recursive --verbose --delete ~/go/misc/vim/ ~/.vim/go
#rsync --recursive --verbose --delete ~/Go/src/github.com/nsf/gocode/vim/ ~/.vim/gocode

# To test ...
# https://github.com/airblade/vim-gitgutter.git

git_clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/ycm
git_clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/solarized
git_clone https://github.com/bling/vim-airline.git ~/.vim/airline
git_clone https://github.com/ervandew/supertab.git ~/.vim/supertab
git_clone https://github.com/fatih/vim-go ~/.vim/go
git_clone https://github.com/gregsexton/gitv.git ~/.vim/gitv
git_clone https://github.com/majutsushi/tagbar.git ~/.vim/tagbar
git_clone https://github.com/scrooloose/syntastic.git ~/.vim/syntastic
git_clone https://github.com/tpope/vim-fugitive.git ~/.vim/fugitive
git_clone https://github.com/vim-scripts/indenthtml.vim.git ~/.vim/indenthtml
git_clone https://github.com/vim-scripts/matchit.zip.git ~/.vim/matchit

cd ~/.vim/ycm && ./install.sh --clang-completer && cd -
