" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"C:\Program Files (x86)\Vim\bundle
call plug#begin('C:/Program Files (x86)/Vim/vim82/bundle')

" Make sure you use single quotes

"Plugins for interface
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'luochen1990/rainbow'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'powerline/powerline'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'

"Plugins for themes
"Plug 'morhetz/gruvbox'
Plug 'micha/vim-colors-solarized'
Plug 'dracula/vim'
"Plug 'rakr/vim-one'
"Plug 'rakr/vim-two-firewatch'
"Plug 'therubymug/vim-pyte'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'junegunn/seoul256.vim'
Plug 'ludokng/vim-odyssey'
Plug 'machakann/vim-colorscheme-tatami'
Plug 'zekzekus/menguless'

"Plugins for browse file
Plug 'preservim/nerdtree'

"Plugins for functions
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'valloric/youcompleteme'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-startify'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()
