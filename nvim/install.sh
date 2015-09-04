#! /usr/bin/env bash

. ../helpers.sh

pip_install flake8

#cp -v nvimrc ~/.nvimrc

mkdir -p ~/.nvim/templates

mkdir -p ~/.nvim/colors
cp -v base16-default.vim ~/.nvim/colors

cp -v python.py ~/.nvim/templates

# Completion
git_clone https://github.com/Shougo/neocomplete.vim.git ~/.nvim/neocomplete
git_clone https://github.com/ervandew/supertab.git ~/.nvim/supertab

# YAML
# git_clone https://github.com/stephpy/vim-yaml.git ~/.vim/yaml

# Interface
git_clone https://github.com/bling/vim-airline.git ~/.nvim/airline
#git_clone https://github.com/majutsushi/tagbar.git ~/.vim/tagbar
#git_clone https://github.com/vim-scripts/matchit.zip.git ~/.vim/matchit

# Git
git_clone https://github.com/airblade/vim-gitgutter.git ~/.nvim/gitgutter
#git_clone https://github.com/gregsexton/gitv.git ~/.vim/gitv
git_clone https://github.com/tpope/vim-fugitive.git ~/.nvim/fugitive

# Go
git_clone https://github.com/fatih/vim-go ~/.nvim/go

# Lint
#git_clone https://github.com/scrooloose/syntastic.git ~/.vim/syntastic

# HTML
#git_clone https://github.com/vim-scripts/indenthtml.vim.git ~/.vim/indenthtml

# LanguageTool
#git_clone https://github.com/vim-scripts/LanguageTool.git ~/.vim/languagetool
