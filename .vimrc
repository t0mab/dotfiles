" Cheat sheet :
" `za` - toggles
" `zc` - closes
" `zo` - opens
" `zR` - open all
" `zM` - close all

" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Activate fugitive
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" Change default leader mapping
let mapleader = ","

" Navigate buffers
noremap <F1> :bprev<CR>
noremap <F2> :bnext<CR>

" Toggle NERD Tree
map <F3> <Esc>:NERDTreeToggle<CR>

" NERD Tree minimal UI
let NERDTreeMinimalUI = 1

" Toggle line numbers and fold column for easy copying
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

" Install the current Python module
map <F5> :!pyup<CR>

" Copy to system clipboard
set clipboard=unnamedplus

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

" Activate plugin and indent
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

" Keep the previous indentation
set autoindent

" Use tabs by default
set noexpandtab

" Proper indentation for Python
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set foldmethod=indent
autocmd FileType python set foldlevel=1
autocmd FileType python set expandtab

" Define a template for new Python files
autocmd BufNewFile *.py 0read ~/.vim/templates/python.py

" Proper indentation for Ruby
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set expandtab

" Fix filetype for Django template files
autocmd BufNewFile,BufRead *.html set filetype=htmldjango.html

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set softtabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2

" Proper indentation for Eruby
autocmd BufNewFile,BufRead *.erb set tabstop=2
autocmd BufNewFile,BufRead *.erb set softtabstop=2
autocmd BufNewFile,BufRead *.erb set shiftwidth=2

" Proper indentation for Arduino
autocmd BufNewFile,BufRead *.pde set ft=arduino
autocmd BufNewFile,BufRead *.pde set tabstop=2
autocmd BufNewFile,BufRead *.pde set softtabstop=2
autocmd BufNewFile,BufRead *.pde set shiftwidth=2
autocmd BufNewFile,BufRead *.pde set expandtab

" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" A better keybinding for the Autocompletion
" inoremap <Nul> <C-x><C-o>

" Remove automatically all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

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
" set mouse=a

" Unix like tab completion.
set wildmenu
set wildmode=longest,list

" Avoid many press enter to continue prompts and more. See :help shortmess for
" the breakdown of what this changes. You can also pare things down further if
" you like.
set shortmess=atI

" Allow to use OmniComplete with SuperTab
let g:SuperTabDefaultCompletionType = "context"
