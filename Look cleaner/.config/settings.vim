"Remap the leader keys
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

au VimEnter * if !&diff | tab all | tabfirst | endif
au GUIEnter * simalt ~x
"au BufAdd,BufNewFile * nested tab sball

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
set novisualbell  
set noerrorbells 
set showtabline=2
set splitright splitbelow
set hidden
syntax enable
filetype plugin indent on
