My home files
=============

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
* NERD Tree
* Pathogen
* closetag
* fugitive
* indenthtml
* pyflakes
* snipmate
* surround
* tagbar

Available shortcuts :
* F1 : previous buffer
* F2 : next buffer
* F3 : toggle NERD Tree
* F4 : toggle line numbers
* F5 : execute "./setup.py install" in git root directory
* F8 : toggle between dark and light solarized color schemes
* F9 : toggle tagbar

Scrips
------

Provide various scrips :
* configure-gnome-terminal.sh : set my favorite settings for Gnome Terminal using gconf command
* install*.sh: some installation scripts for various projects I use
* nef-backups.sh : backup every NEF files from many card reader to one directory
* nef-to-jpg.sh : convert NEF files to JPEG
* packages.sh : install every packages listed in ~/.packages

TMUX
----

Tmux configuration :
* change prefix to ctrl-a (like Screen)
* change some colors
* change some shortcuts (horizontal split -> prefix -, etc)
