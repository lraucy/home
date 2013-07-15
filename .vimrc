" -----------------------------------------
" Pathogen init
" -----------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" -----------------------------------------
" General vim configuration
" -----------------------------------------
syntax on
filetype on
filetype plugin on
filetype plugin indent on

set number
set wildmenu
set mouse=a

colorscheme vitamins

" Search config
set incsearch
set hlsearch

" Fold config
set foldmethod=indent
set foldlevel=99

" 4 spaces for indent and display tabs and trailing spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list lcs=tab:>-,trail:.

" -----------------------------------------
" Bindings
" -----------------------------------------
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map <F3> :set filetype=python<CR>
" Toggle autoindent on paste with F4
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>
map <F6> :set foldlevel=99<CR>
map <F7> :set foldlevel=1<CR>
map <F8> :cprev<CR>
map <F9> :tnext<CR>
map <F12> :cn<CR>
" Change window with control + direction
map <c-Down> <c-w>j
map <c-Up> <c-w>k
map <c-Right> <c-w>l
map <c-Left> <c-w>h


" -----------------------------------------
" -----------------------------------------
" Language specific stuff
" -----------------------------------------
" -----------------------------------------
"
" Docstrings
" -----------------------------------------
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
"
"
" -----------------------------------------
" PHP
" -----------------------------------------
let php_oldStyle = 1
" check syntax with Ctrl + L
autocmd FileType php noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt;
autocmd FileType phtml noremap &lt;

" -----------------------------------------
" HTML
" -----------------------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2


" ----------------------------------------
" Additional commands
" ----------------------------------------
" Nice grep with .git & tags exclusion
command -nargs=1 Grep grep -RnI --exclude-dir=.git --exclude=tags <args> .
" Nice grep with .git & tags exclusion, only for Python files
command -nargs=1 PyGrep grep -RnI --include='*.py' --exclude-dir=.git --exclude=tags <args> .


" Plugins settings
" ----------------------------------------
" ----------------------------------------
"
" Powerline
" ----------------------------------------
set nocompatible "disable vi compatibility
set laststatus=2 " always show statusline
set encoding=utf-8 " show unicode glyphs
"
" Airline
" ----------------------------------------
let g:airline_theme='light'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␤ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

" Syntax checking plugins & config
" ----------------------------------------
"let g:pyflakes_use_quickfix = 0  Pyflakes disabled in favor of syntastic
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_python_checkers=['pylint', 'pyflakes', 'pep8']
" Disable some pylint checks
" Configure pylint check
" See
" https://github.com/kmmbvnr/django-jenkins/blob/master/django_jenkins/tasks/pylint.rc
" for details.
let g:syntastic_python_pylint_args="-f parseable -r n -i y --rcfile=~/.pylint.rc"

" slime config
let g:slime_target = "tmux"
let b:slime_config = {"socket_name": "default", "target_pane": ":.+1"}
let g:slime_paste_file="~/.tmux_slime_paste_file"
let g:slime_python_ipython=1

" Unite.vim config
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
