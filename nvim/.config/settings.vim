"Remap the leader keys
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

au VimEnter * if !&diff | tab all | tabfirst | endif
au GUIEnter * simalt ~x
autocmd GUIEnter * set visualbell t_vb=
"au BufAdd,BufNewFile * nested tab sball
autocmd BufEnter * silent! lcd %:p:h
autocmd TermOpen * set bufhidden=hide
autocmd TermOpen * startinsert

set hls
set is
set cb=unnamed
set ts=4
set sw=4
set number
set ruler
set showcmd
set showmatch
set mouse=a
set relativenumber
set backspace=indent,eol,start
set splitright splitbelow
set title
set laststatus=2
set noshowmode
set encoding=utf-8
set expandtab
set conceallevel=2
set cursorline
set guicursor+=a:blinkon0
set noerrorbells visualbell t_vb=
set belloff=all
set showtabline=2
set hidden
set noswapfile
set wildmenu
set lazyredraw
set updatetime=200
set ttimeoutlen=50
set nobackup
set nowritebackup
let NERDTreeQuitOnOpen=1
syntax enable
syntax on
filetype plugin indent on
