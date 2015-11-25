" Termite supports true colors so let's use them
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Load pathogen
execute pathogen#infect()

" Filetypes
filetype on
filetype plugin indent on
filetype plugin on

" Interface
set cursorline
set mouse=
set nowrap
set number
set ruler
set shortmess=atI " Shorter messages and avoid useless Enter strikes
set showmatch " Highlight matching brackets
set so=10 " Set 10 lines to the cursor when moving vertically
set splitbelow " Split below by default
set splitright " Split on the right side by default
syntax on

" Neovim python module
let g:python_host_prog='python2'

" Move around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move around tabs
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Indentation
set smartindent

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set fileformat=unix

au BufNewFile,BufRead *.css, *.html, *.j2, *.js
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Completion
set wildignore+=.git,*.o,*.obj,*.pyc,*.DS_STORE,*.swc,*.bak " Ignore some files

" Mail redaction
au BufRead ~/.mutt/tmp/mutt-* set tw=72 " Mutt

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Delete useless spaces
autocmd BufWritePre * :%s/\s\+$//e

" Run neomake on write
autocmd BufWritePost * Neomake

" Filetypes
autocmd BufNewFile,BufRead *.j2 set ft=jinja2
autocmd BufNewFile,BufRead *.pde set ft=arduino
autocmd BufNewFile,BufRead *.yml set ft=ansible

" Learn the hard way
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Colors
colorscheme gruvbox
set background=dark
highlight Normal guibg=none
highlight SignColumn guibg=none
highlight GitGutterAdd guibg=none
highlight GitGutterChange guibg=none
highlight GitGutterDelete guibg=none
highlight GitGutterChangeDelete guibg=none

" Airline
set completeopt-=preview
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_powerline_fonts=1

"DelimitMate
let g:delimitMate_expand_cr=1

" Git
" Just use it to visualize change, nothing else
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1

" Go
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Python
autocmd BufNewFile *.py 0read ~/.config/nvim/templates/python.py
