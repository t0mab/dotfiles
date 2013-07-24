" Airline
set rtp+=~/.vim/airline/
set completeopt-=preview
set laststatus=2
set noshowmode
let g:airline_powerline_fonts=1
let g:airline_theme='solarized2'

" CloseTag
set rtp+=~/.vim/closetag/

" Fugitive
set rtp+=~/.vim/fugitive/

" Coffee Script
set rtp+=~/.vim/coffeescript/

" Go
au BufRead,BufNewFile *.go set filetype=go
set rtp+=~/.vim/go/

" Gocode
set rtp+=~/.vim/gocode/

" IndentHTML
set rtp+=~/.vim/indenthtml/

" Jedi
" set rtp+=~/.vim/jedi/

" Matchit
set rtp+=~/.vim/matchit/

" Solarized
set rtp+=~/.vim/solarized/
call togglebg#map("<F8>")
let g:solarized_termtrans = 0
colorscheme solarized
set background=dark

" Syntastic
set rtp+=~/.vim/syntastic
let g:syntastic_check_on_open=0
let g:syntastic_python_checker="flake8"
let g:syntastic_python_checker_args='--ignore=E501'

" Reactivate filetype after plugin loads
filetype on
filetype plugin indent on
syntax on

" Highlight the 80th column
set colorcolumn=80

" Change default leader mapping
let mapleader = ","

" Navigate buffers
noremap <F1> :bprev<CR>
noremap <F2> :bnext<CR>

" Toggle line numbers and fold column for easy copying
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

" Copy to system clipboard
set clipboard=unnamedplus

" Enable 256 color in vim.
set t_Co=256

" Ignore some files
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.swc,*.bak

" Save all temporary files in a central directory. Very useful.
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" Show line numbers, rulers, etc
set ruler

" Show cursor line
set cursorline

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
set omnifunc=syntaxcomplete#Complete

" Keep the previous indentation
set autoindent

" Use tabs by default
set noexpandtab

" Proper indentation for Python
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
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

" Fix filetype for CoffeeScript files
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.coffee set tabstop=2
autocmd BufNewFile,BufRead *.coffee set softtabstop=2
autocmd BufNewFile,BufRead *.coffee set shiftwidth=2
autocmd BufNewFile,BufRead *.coffee set expandtab

" Automatically run CoffeeCompile watch vertical on CoffeeScript files
"autocmd BufNewFile,BufRead *.coffee :CoffeeCompile watch vertical

" Proper indentation for HTML
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set softtabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.html set expandtab

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

" Unix like tab completion.
set wildmenu
set wildmode=longest,list

" Avoid many press enter to continue prompts and more. See :help shortmess for
" the breakdown of what this changes. You can also pare things down further if
" you like.
set shortmess=atI
