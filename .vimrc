" Cheat sheet :
" `za` - toggles
" `zc` - closes
" `zo` - opens
" `zR` - open all
" `zM` - close all

" Enable 16 color in vim.
set t_Co=16

" Ignore some files
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.swc,*.bak

" Enable solarized bg toggle plugin
call togglebg#map("<F8>")

" Enable Tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_usearrows = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0

" Save all temporary files in a central directory. Very useful.
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" Activate plugin and indent
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

" Keep the previous indentation
set autoindent

" Show line numbers, rulers, etc
set ruler

" Show cursor line
set cursorline

" Activate and choose nice colors
syntax on
set background=dark
colorscheme solarized

" Indicates a fast terminal connection
set ttyfast

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
autocmd FileType python set foldmethod=indent

" Define a template for new Python files
autocmd BufNewFile *.py 0read ~/.vim/templates/python.py

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

" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" A better keybinding for the Autocompletion
inoremap <Nul> <C-x><C-o>

" Remove automatically all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Arduino
autocmd BufNewFile,BufRead *.pde set ft=arduino
autocmd BufNewFile,BufRead *.pde set expandtab
autocmd BufNewFile,BufRead *.pde set tabstop=2
autocmd BufNewFile,BufRead *.pde set softtabstop=2
autocmd BufNewFile,BufRead *.pde set shiftwidth=2
autocmd BufNewFile,BufRead *.pde set autoindent

" Learn the hard way
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Add mouse support
set mouse=a

" Unix like tab completion.
set wildmenu
set wildmode=longest,list

" Avoid many press enter to continue prompts and more. See :help shortmess for
" the breakdown of what this changes. You can also pare things down further if
" you like.
set shortmess=atI
