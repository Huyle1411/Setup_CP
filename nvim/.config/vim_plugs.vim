" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"C:\Program Files (x86)\Vim\bundle
call plug#begin('~/.config/nvim/autoload/plugged')

" Make sure you use single quotes

"Plugins for interface
Plug 'jiangmiao/auto-pairs'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'powerline/powerline'
Plug 'ryanoasis/vim-devicons'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"Plugins for themes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

"Plugins for browse file
Plug 'scrooloose/nerdtree'

"Plugins for functions
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'valloric/youcompleteme'
Plug 'skywind3000/asyncrun.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'unblevable/quick-scope' 

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()
