https://github.com/SublimeCodeIntel/SublimeCodeIntel.git:
  git.latest:
    - target: /home/fabien/.config/sublime-text-3/Packages/SublimeCodeIntel

https://github.com/biermeester/Pylinter.git:
  git.latest:
    - target: /home/fabien/.config/sublime-text-3/Packages/Pylinter

https://github.com/alienhard/SublimeAllAutocomplete:
  git.latest:
    - target: /home/fabien/.config/sublime-text-3/Packages/SublimeAllAutocomplete

https://github.com/DisposaBoy/GoSublime.git:
  git.latest:
    - target: /home/fabien/.config/sublime-text-3/Packages/GoSublime

https://github.com/buymeasoda/soda-theme.git:
  git.latest:
    - target: "/home/fabien/.config/sublime-text-3/Packages/Theme - Soda"

https://github.com/jonschlinkert/sublime-monokai-extended.git:
  git.latest:
    - target: /home/fabien/.config/sublime-text-3/Packages/sublime-monokai-extended

/home/fabien/.config/sublime-text-3/Packages/User/Preferences.sublime-settings:
  file.managed:
    - source: salt://st3/Preferences.sublime-settings
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings:
  file.managed:
    - source: salt://st3/GoSublime.sublime-settings
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.config/sublime-text-3/Packages/User/Pylinter.sublime-settings:
  file.managed:
    - source: salt://st3/Pylinter.sublime-settings
    - user: fabien
    - group: fabien
    - mode: 444
