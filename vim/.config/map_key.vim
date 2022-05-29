"Settings for youcompleteme
" let g:ycm_enable_diagnostic_signs=1
" let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
"set signcolumn=no
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger=1
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_auto_hover=''
"let g:cpp_no_function_highlight = 1
" let g:ycm_warning_symbol = 'WR'
" let g:ycm_error_symbol = 'ER'

"Window size async
"let g:asyncrun_open = 12
"let g:asuncrun_bell = 1

nnoremap <silent> <Leader>yy :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>y: :YcmCompleter<Space>

"Use tab to switch buffers
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab>   :bn<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

tnoremap <silent> <C-[><C-[> <C-\><C-n>

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

let g:AutoPairsShortcutToggle = '<F3>'

"call togglebg#map("<F2>")
let NERDTreeQuitOnOpen = 1 "closes NerdTree when opening a file
map <F7> :NERDTreeToggle<CR>


"Compile and run
set makeprg=build_old.sh\ %:r
autocmd filetype cpp nnoremap <F5> :%y+<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> :Make <CR>
autocmd filetype cpp nnoremap <S-F9> :w <bar> :vertical terminal ++shell ++cols=90 build.sh %:r -d -c <CR>
" autocmd filetype cpp nnoremap <F9> :w <bar> :vertical terminal ++shell ++cols=90 build.sh %:r -d <CR>
autocmd filetype cpp nnoremap <C-F9> :w <bar> :vertical terminal ++shell ++cols=90 build.sh %:r <CR>
autocmd filetype cpp nnoremap <F10> : vertical terminal ++shell ./%:r<CR>
autocmd filetype cpp nnoremap <F8> :!./%:r<CR>

let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
