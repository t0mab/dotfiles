mplayer:
  pkg.installed

/home/fabien/.mplayer/config:
  file.managed:
    - source: salt://mplayer/config
    - user: fabien
    - group: fabien
    - mode: 444
