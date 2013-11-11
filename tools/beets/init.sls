/home/fabien/.config/beets/config.yaml:
  file.managed:
    - source: salt://tools/beets/config.yaml
    - user: fabien
    - group: fabien
    - mode: 444
  pip.installed:
    - name: beets
    - upgrade: True
