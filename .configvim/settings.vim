"Remap the leader keys
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

au VimEnter * if !&diff | tab all | tabfirst | endif
au GUIEnter * simalt ~x
autocmd GUIEnter * set visualbell t_vb=
"au BufAdd,BufNewFile * nested tab sball
autocmd VimEnter * set bufhidden=hide
autocmd VimEnter * set vb t_vb=
"autocmd VimEnter * startinsert
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufEnter * silent! lcd %:p:h

let g:templates_no_autocmd = 1

"set autochdir
set hls
set t_vb=
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
set conceallevel=2
set cursorline
set noerrorbells visualbell t_vb=
set belloff=all
set showtabline=2
set splitright splitbelow
set hidden
set noswapfile
set wildmenu
set lazyredraw
set updatetime=200
set ttimeoutlen=50
set wak=no
syntax enable
filetype plugin indent on

" Makes bash open in the working directory
let $CHERE_INVOKING=1
"clang-format
map <C-K> :py3f C:\Program Files\LLVM\share\clang\clang-format.py<cr>
imap <C-K> <c-o>:py3f C:\Program Files\LLVM\share\clang\clang-format.py<cr>
function! Formatonsave()
	let l:lines="all"
	py3f C:\Program Files\LLVM\share\clang\clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" Default path for Cygwin 64-bit, change accordingly
set shell=C:\cygwin64\bin\bash.exe
"set shell='C:\Program Files\Git\bin\bash.exe'

" Without --login, Cygwin won't mount some directories such as /usr/bin/
set shellcmdflag=--login\ -c

" Default value is (, but bash needs "
set shellxquote=\"

" Paths will use / instead of \
set shellslash
