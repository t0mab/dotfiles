/home/fabien/.vimrc:
  file.managed:
    - source: salt://editors/vim/vimrc
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.vim:
  file.directory:
    - user: fabien
    - group: fabien
    - mode: 755

/home/fabien/.vim/templates/python.py:
  file.managed:
    - source: salt://editors/vim/python.py
    - user: fabien
    - group: fabien
    - mode: 444

https://github.com/bling/vim-airline.git:
  git.latest:
    - target: /home/fabien/.vim/airline
    - user: fabien

https://github.com/vim-scripts/closetag.vim.git:
  git.latest:
    - target: /home/fabien/.vim/closetag
    - user: fabien

https://github.com/kchmck/vim-coffee-script.git:
  git.latest:
    - target: /home/fabien/.vim/coffeescript
    - user: fabien

https://github.com/tpope/vim-fugitive.git:
  git.latest:
    - target: /home/fabien/.vim/fugitive
    - user: fabien

https://github.com/Blackrush/vim-gocode.git:
  git.latest:
    - target: /home/fabien/.vim/gocode
    - user: fabien

https://github.com/vim-scripts/indenthtml.vim.git:
  git.latest:
    - target: /home/fabien/.vim/indenthtml
    - user: fabien

https://github.com/davidhalter/jedi-vim.git:
  git.latest:
    - target: /home/fabien/.vim/jedi
    - user: fabien

https://github.com/vim-scripts/matchit.zip.git:
  git.latest:
    - target: /home/fabien/.vim/matchit
    - user: fabien

https://github.com/altercation/vim-colors-solarized.git:
  git.latest:
    - target: /home/fabien/.vim/solarized
    - user: fabien

https://github.com/scrooloose/syntastic.git:
  git.latest:
    - target: /home/fabien/.vim/syntastic
    - user: fabien

https://github.com/majutsushi/tagbar.git:
  git.latest:
    - target: /home/fabien/.vim/tagbar
    - user: fabien

https://github.com/ervandew/supertab.git:
  git.latest:
    - target: /home/fabien/.vim/supertab
    - user: fabien

flake8:
  pip.installed:
    - upgrade: True
