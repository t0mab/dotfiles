[ ! -d ~/.config/fontconfig/conf.d ] && ~/.config/fontconfig/conf.d

cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

[ ! -d ~/.fonts ] && mkdir ~/.fonts

cp -v Ubuntu+Mono+derivative+Powerline.ttf ~/.fonts

fc-cache -vf ~/.fonts
