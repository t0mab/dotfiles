#! /usr/bin/env bash

. ../helpers.sh

cp -v vimrc ~/.vimrc

[ ! -d ~/.vim-tmp ] && mkdir ~/.vim-tmp
[ ! -d ~/.vim/templates ] && mkdir -p ~/.vim/templates

cp -v python.py ~/.vim/templates

rsync --recursive --verbose --delete ~/go/misc/vim/ ~/.vim/go
rsync --recursive --verbose --delete ~/Go/src/github.com/nsf/gocode/vim/ ~/.vim/gocode

git_clone https://github.com/bling/vim-airline.git ~/.vim/airline
git_clone https://github.com/vim-scripts/closetag.vim.git ~/.vim/closetag
git_clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/coffeescript
git_clone https://github.com/tpope/vim-fugitive.git ~/.vim/fugitive
git_clone https://github.com/vim-scripts/indenthtml.vim.git ~/.vim/indenthtml
git_clone https://github.com/vim-scripts/matchit.zip.git ~/.vim/matchit
git_clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/solarized
git_clone https://github.com/scrooloose/syntastic.git ~/.vim/syntastic
git_clone https://github.com/majutsushi/tagbar.git ~/.vim/tagbar
git_clone https://github.com/ervandew/supertab.git ~/.vim/supertab
git_clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/ycm

cd ~/.vim/ycm && ./install.sh --clang-completer && cd -

sudo pip install --upgrade flake8
