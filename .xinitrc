#!/bin/sh

# HiDPI support
if [ -f ~/.hidpi ]; then
  export GDK_SCALE=2
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Japanese input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &

# Use a compositor to avoir tearing screen
/usr/bin/compton -CG --backend glx --paint-on-overlay --glx-no-stencil --glx-no-rebind-pixmap --vsync opengl-swc &

[[ -d ~/Sync/Wallpapers ]] && feh --randomize --bg-fill ~/Sync/Wallpapers/*

/usr/bin/start-pulseaudio-x11 &

exec bspwm
