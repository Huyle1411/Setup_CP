"text font (better use Nerd font to support devicons)
set guifont=DejaVuSansMono_Nerd_Font_Mono:h10

"active color pair
let g:rainbow_active = 1

"theme
"colorscheme gruvbox
set background=light
let g:airline_theme='solarized'

"----- Customize for vim-airlines -----" 
"enable tabline
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

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

"--------------------------------------"

"setting for color terminal
if !has("gui_running")
    "set term=xterm
    set t_Co=256
endif

if (has("termguicolors"))
  set termguicolors
endif
