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
git_clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized

# IPython
sudo pip install ipython
sudo pip3 install ipython
mkdir -p ~/.ipython/profile_default
cp -v ipython_config.py ~/.ipython/profile_default

# Mplayer
mkdir -p ~/.mplayer
cp -v mplayer_config ~/.mplayer/config

# Subtitles
sudo pip install --upgrade BeautifulSoup
sudo pip install --upgrade periscope
sudo pip install --upgrade subliminal

# SSH
mkdir -p ~/.ssh
cp -v ssh_config ~/.ssh/config

# psql
cp -v psqlrc ~/.psqlrc
