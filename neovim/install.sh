#! /bin/sh

rm -rf ~/.nvim*

. ../helpers.sh

mkdir -p ~/.nvim/templates
cp -v nvimrc ~/.nvimrc
cp -v python.py ~/.nvim/templates
# Interface
mkdir -p ~/.nvim/colors
cp -v base16-default.vim ~/.nvim/colors
git_clone https://github.com/bling/vim-airline.git ~/.nvim/airline

# Git
git_clone https://github.com/tpope/vim-fugitive.git ~/.nvim/fugitive
git_clone https://github.com/airblade/vim-gitgutter.git ~/.nvim/gitgutter

# Ansible
git_clone https://github.com/pearofducks/ansible-vim.git ~/.nvim/ansible

# Go
git_clone https://github.com/fatih/vim-go.git ~/.nvim/go

# HTML
git_clone https://github.com/mattn/emmet-vim.git ~/.nvim/emmet

# Completion
git_clone https://github.com/Valloric/YouCompleteMe.git ~/.nvim/youcompleteme
cd ~/.nvim/youcompleteme && python2 ./install.py --gocode-completer
