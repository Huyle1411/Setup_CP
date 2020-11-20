"source $VIMRUNTIME/cp.vim

set nocompatible              " be iMproved, required
filetype off                  " required

let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"C:\Program Files (x86)\Vim\bundle
call plug#begin('C:/Program Files (x86)/Vim/bundle')

" Make sure you use single quotes

Plug 'jiangmiao/auto-pairs'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

au GUIEnter * simalt ~x
au BufAdd,BufNewFile * nested tab sball

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
filetype plugin indent on

set guifont=DejaVuSansMono_Nerd_Font_Mono:h10

let g:rainbow_active = 1
syntax enable
colorscheme gruvbox
set background=light

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''


let g:ycm_enable_diagnostic_signs=0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:asyncrun_open = 11

if !has("gui_running")
    set t_Co=256
endif

if (has("termguicolors"))
  set termguicolors
endif

nnoremap <silent> <Leader>yy :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>y: :YcmCompleter<Space>

nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab>   :tabnext<CR>

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

tnoremap <silent> <C-[><C-[> <C-\><C-n>

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

let g:AutoPairsShortcutToggle = '<F3>'

call togglebg#map("<F2>")
map <F7> :NERDTreeToggle<CR>
autocmd filetype cpp nnoremap <silent> <F9> :w <bar> AsyncRun g++ -g -std=c++17 -D_DEBUG -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion %:r.cpp -o %:r<CR>
autocmd filetype python nnoremap <F9> :w <bar> !start cmd /c py % & pause<CR>
autocmd filetype cpp nnoremap <F10> :!start cmd /c %:r & pause <CR>
autocmd filetype cpp nnoremap <F5> :%y+<CR>

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

