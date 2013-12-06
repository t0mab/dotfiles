/home/fabien/.config/fontconfig/conf.d/10-powerline-symbols.conf:
  file.managed:
    - source: salt://editors/fonts/10-powerline-symbols.conf
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.fonts:
   file.directory:
     - mode: 555

/home/fabien/.fonts/PowerlineSymbols.otf:
  file.managed:
    - source: salt://editors/fonts/PowerlineSymbols.otf
    - user: fabien
    - group: fabien
    - mode: 444

fc-cache -vf ~/.fonts:
  cmd.run:
    - user: fabien
