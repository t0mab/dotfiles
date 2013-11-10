/home/fabien/.vimrc:
  file.managed:
    - source: salt://vim/vimrc
    - user: fabien
    - group: fabien
    - mode: 444

/home/fabien/.vim/templates/python.py:
  file.managed:
    - source: salt://vim/python.py
    - user: fabien
    - group: fabien
    - mode: 444

https://github.com/bling/vim-airline.git:
  git.latest:
    - target: /home/fabien/.vim/airline

https://github.com/vim-scripts/closetag.vim.git:
  git.latest:
    - target: /home/fabien/.vim/closetag

https://github.com/kchmck/vim-coffee-script.git:
  git.latest:
    - target: /home/fabien/.vim/coffeescript

https://github.com/tpope/vim-fugitive.git:
  git.latest:
    - target: /home/fabien/.vim/fugitive

https://github.com/Blackrush/vim-gocode.git:
  git.latest:
    - target: /home/fabien/.vim/gocode

https://github.com/vim-scripts/indenthtml.vim.git:
  git.latest:
    - target: /home/fabien/.vim/indenthtml

https://github.com/davidhalter/jedi-vim.git:
  git.latest:
    - target: /home/fabien/.vim/jedi

https://github.com/vim-scripts/matchit.zip.git:
  git.latest:
    - target: /home/fabien/.vim/matchit

https://github.com/altercation/vim-colors-solarized.git:
  git.latest:
    - target: /home/fabien/.vim/solarized

https://github.com/scrooloose/syntastic.git:
  git.latest:
    - target: /home/fabien/.vim/syntastic

https://github.com/majutsushi/tagbar.git:
  git.latest:
    - target: /home/fabien/.vim/tagbar

https://github.com/ervandew/supertab.git:
  git.latest:
    - target: /home/fabien/.vim/supertab
