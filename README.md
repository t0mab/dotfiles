My home files
=============

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

git clone --bare git@github.com:fabienengels/dotfiles.git

git --git-dir=/home/fabien/.dotfiles --work-tree=/home/fabien config --local status.showUntrackedFiles no
git --git-dir=/home/fabien/.dotfiles --work-tree=/home/fabien checkout
