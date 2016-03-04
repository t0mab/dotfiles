My home files
=============

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

git clone --bare git@github.com:fabienengels/dotfiles.git ~/.dotfiles

git --git-dir=/home/fabien/.dotfiles --work-tree=/home/fabien config --local status.showUntrackedFiles no

git --git-dir=/home/fabien/.dotfiles --work-tree=/home/fabien checkout


Adding a worktree
=================

dotfiles subtree add -P ~/.config/nvim/bundle/ctrlp https://github.com/ctrlpvim/ctrlp.vim.git master --squash

Updating a worktree
===================

dotfiles subtree  pull-P ~/.config/nvim/bundle/ctrlp https://github.com/ctrlpvim/ctrlp.vim.git master --squash
