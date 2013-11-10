irssi:
  pkg.installed

irssi-scripts:
  pkg.installed

/usr/local/bin/irc.sh:
  file.managed:
    - source: salt://irssi/irc.sh
    - user: root
    - group: root
    - mode: 555

/home/fabien/.irssi:
  file.recurse:
    - source: salt://irssi/irssi
    - user: fabien
    - group: fabien
    - dir_mode: 550
    - file_mode: 440
