. ../helpers.sh

set -e

# Git
cp -v gitconfig ~/.gitconfig

# Tmux
cp -v tmux.conf ~/.tmux.conf

# Zsh
cp -v zshrc ~/.zshrc
cp -v zshenv ~/.zshenv
git_clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#git_clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized

mkdir -p ~/.base16
cp -v base16-default.* ~/.base16

# IPython
#sudo pip install ipython
#sudo pip3 install ipython
mkdir -p ~/.ipython/profile_default
cp -v ipython_config.py ~/.ipython/profile_default

# GPG Agent
mkdir ~/.gnupg
cp -v gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Mplayer
mkdir -p ~/.mplayer
cp -v mplayer_config ~/.mplayer/config

# SSH
mkdir -p ~/.ssh
cp -v ssh_config ~/.ssh/config

# psql
cp -v psqlrc ~/.psqlrc

# Subtitles
pip2_install subliminal
pip2_install guessit

# FlexGet
pip2_install flexget
pip2_install transmissionrpc

# Shut up parallel
mkdir -p ~/.parallel
touch ~/.parallel/will-cite
