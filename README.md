My home files
=============

Finally, after using Vim Bundle, I decided to switch back to git submodules.
So to install these dotfiles, the procedure is the following :
```bash
cd
git clone https://github.com/fabienengels/dotfiles.git .dotfiles
cd .dotfiles
git submodule update --init --recursive
./install.py
```

Solarized
---------

Add Solarized colors (http://ethanschoonover.com/solarized) support to :
* Gnome Terminal : https://github.com/sigurdga/gnome-terminal-colors-solarized
* VIM : https://github.com/altercation/vim-colors-solarized
* dircolors : https://github.com/seebi/dircolors-solarized

Switch between dark and light colors :
* VIM : press F8 key
* Gnome Terminal and dircolors : "light" and "dark" aliases

VIM
---

Some basic stuffs for VIM :
* Remove useless spaces on file save
* Deactivate arrow keys to force myself to learn "hjkl" moves
* Add some settings to edit Ruby, Python, CSS and HTML files
* Some settings from Lion Krischer (https://github.com/krischer/dotfiles)

and plugins :
* [Airline](https://github.com/bling/vim-airline) (much faster than powerline !)
* [Closetag](https://github.com/vim-scripts/closetag.vim)
* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Indenthtml](https://github.com/vim-scripts/indenthtml.vim)
* [CoffeeScript](https://github.com/kchmck/vim-coffee-script)
* [MatchIt](https://github.com/vim-scripts/matchit.zip.git)
* [Syntastic](https://github.com/scrooloose/syntastic.git)

Available shortcuts :
* F1 : previous buffer
* F2 : next buffer
* F4 : toggle line numbers
* F8 : toggle between dark and light solarized color schemes

Scrips
------

Provide various scrips :
* configure-gnome-terminal.sh : set my favorite settings for Gnome Terminal using gconf command
* nef-backups.sh : backup every NEF files from many card reader to one directory
* nef-to-jpg.sh : convert NEF files to JPEG
* packages.sh : install many packages that I'm used to

TMUX
----

Tmux configuration :
* change some colors
* change some shortcuts (horizontal split -> prefix -, etc)
