" Enable 256 color in vim.
set t_Co=256

" Set a fancy status bar.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POSITION=%04l,%04v][%p%%]\ [LEN=%L]\ [GIT-BRANCH=%{GitBranch()}]

" All yanking and pasting works with the actual system clipboard. Does not
" work with all vim version but other ways to achieve this behaviour also
" exist.
set clipboard=unnamed

" Save all temporary files in a central directory. Very useful.
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp


" Activate plugin and indent
filetype indent on
filetype plugin on

" Keep the previous indentation
set autoindent

" Activate and choose nice colors
syntax on
" set background=dark
set background=light
colorscheme solarized

" Show line numbers by default
set number

" Unwrap lines by default
set nowrap

" Toggle line numbers and fold column for easy copying
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Proper indentation for Python
autocmd FileType python set expandtab
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set autoindent

" Proper indentation for Ruby
autocmd FileType ruby set expandtab
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set autoindent

" Proper indentation for HTML
autocmd FileType html set expandtab
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set autoindent

" Autocompletion for Python
autocmd FileType python set omnifunc=pythoncomplete#Complete

" A better keybinding for the Autocompletion
inoremap <Nul> <C-x><C-o>

" Remove automatically all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Javascript folding
" let javaScript_fold=1

" Arduino
autocmd BufNewFile,BufRead *.pde set ft=arduino
autocmd BufNewFile,BufRead *.pde set expandtab
autocmd BufNewFile,BufRead *.pde set tabstop=2
autocmd BufNewFile,BufRead *.pde set softtabstop=2
autocmd BufNewFile,BufRead *.pde set shiftwidth=2
autocmd BufNewFile,BufRead *.pde set autoindent
