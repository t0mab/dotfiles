#! /usr/bin/env bash

. ../helpers.sh

pip_install flake8

cp -v vimrc ~/.vimrc

mkdir -p ~/.vim/templates

mkdir -p ~/.vim/colors
cp -v base16-default.vim ~/.vim/colors

cp -v python.py ~/.vim/templates

# Completion
git_clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/neocomplete
git_clone https://github.com/ervandew/supertab.git ~/.vim/supertab

# YAML
git_clone https://github.com/stephpy/vim-yaml.git ~/.vim/yaml

# Interface
git_clone https://github.com/bling/vim-airline.git ~/.vim/airline
git_clone https://github.com/majutsushi/tagbar.git ~/.vim/tagbar
git_clone https://github.com/vim-scripts/matchit.zip.git ~/.vim/matchit

# Git
git_clone https://github.com/airblade/vim-gitgutter.git ~/.vim/gitgutter
git_clone https://github.com/tpope/vim-fugitive.git ~/.vim/fugitive

# Go
git_clone https://github.com/fatih/vim-go ~/.vim/go

# Lint
git_clone https://github.com/scrooloose/syntastic.git ~/.vim/syntastic

# HTML
git_clone https://github.com/vim-scripts/indenthtml.vim.git ~/.vim/indenthtml

# NERDCommenter
git_clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/nerdcommenter

# Auto-pairs
#git_clone https://github.com/spf13/vim-autoclose ~/.vim/auto-close
#git_clone https://github.com/jiangmiao/auto-pairs ~/.vim/auto-pairs
#git_clone https://github.com/Raimondi/delimitMate.git ~/.vim/delimitmate

# CtrlP
git_clone https://github.com/kien/ctrlp.vim ~/.vim/ctrlp
