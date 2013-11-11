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
    - mode: 644
