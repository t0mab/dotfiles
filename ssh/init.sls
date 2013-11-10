/home/fabien/.ssh/config:
  file.managed:
    - source: salt://ssh/config
    - user: fabien
    - group: fabien
    - mode: 444
