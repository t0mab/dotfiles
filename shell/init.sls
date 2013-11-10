tmux:
  pkg.installed

/home/fabien/.tmux.conf:
  file.managed:
    - source: salt://shell/tmux.conf
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.Xmodmap:
  file.managed:
    - source: salt://shell/Xmodmap
    - user: fabien
    - group: fabien
    - mode: 444

https://github.com/seebi/dircolors-solarized.git:
  git.latest:
    - target: /home/fabien/.dircolors-solarized

https://github.com/sigurdga/gnome-terminal-colors-solarized.git:
  git.latest:
    - target: /home/fabien/.gnome-terminal-colors-solarized
