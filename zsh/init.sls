zsh:
  pkg.installed

/home/fabien/.zshrc:
  file.managed:
    - source: salt://zsh/zshrc
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.zshenv:
  file.managed:
    - source: salt://zsh/zshenv
    - user: fabien
    - group: fabien
    - mode: 444

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: /home/fabien/.oh-my-zsh
