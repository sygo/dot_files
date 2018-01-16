" colors
set t_Co=256
" colorscheme miromiro

" detect filetype, associated plugins and auto indent, enable syntax highlight
filetype off
syntax enable

" backup things
set backup
set backupdir=$HOME/.vim/backups/
set directory=$HOME/.vim/tmp/
set undodir=$HOME/.vim/undo/
set undolevels=1000
set updatecount=100

" editor stuff
set numberwidth=5
set ruler
set showmatch
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set nowrap
set wildmenu
set showcmd
set clipboard=unnamedplus
set backspace=indent,eol,start
set cursorline
set laststatus=2
set showcmd
set scrolloff=5
set sidescrolloff=5


" interface
set report=0
set shortmess=atI

" Ctrl+H opens hex edit mode -- https://github.com/evilsocket
nnoremap <c-h> :%!xxd<cr>
" Ctrl-D opens a shell -- https://github.com/evilsocket
nmap <silent> <C-D> :shell<CR>

" search options
set ignorecase "duh
set smartcase "unless there is a capital letter in there somewhere
set hlsearch
set incsearch
set showmatch
set matchtime=4

" plugin management
set rtp+=~/.vim/bundle/Vundle.vim

" START - added plugins with vundle, keep'em here
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'nanotech/jellybeans.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
call vundle#end()
" END - added plugins with vundle, keep'em back there

" Python Mode Specifics
filetype plugin indent on
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" no effing white line at 80 cols
let g:pymode_options_max_line_length = 0
