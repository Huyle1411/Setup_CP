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
set ts=2
set sw=2
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
set ttymouse=sgr
syntax enable
filetype plugin indent on

"extra config for youcompleteme
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '$HOME/.vim/ycm_extra_conf/.ycm_extra_conf.py'

" Makes bash open in the working directory
let $CHERE_INVOKING=1
"clang-format
map <C-K> :py3f ~/../../usr/share/clang/clang-format-10/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/../../usr/share/clang/clang-format-10/clang-format.py<cr>
function! Formatonsave()
	let l:lines="all"
	py3f ~/../../usr/share/clang/clang-format-10/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
				augroup WSLYank
										autocmd!
														autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
																augroup END
														endif
 
				au BufNewFile,BufRead *.tex
						\ set nocursorline |
						\ set nornu |
						\ set number |
						\ let g:loaded_matchparen=1 |
 
