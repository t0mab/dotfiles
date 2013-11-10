git:
  pkg.installed

/home/fabien/.gitconfig:
  file.managed:
    - source: salt://git/gitconfig
    - user: fabien
    - group: fabien
    - mode: 444
