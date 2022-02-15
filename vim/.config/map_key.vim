"Settings for youcompleteme
let g:ycm_enable_diagnostic_signs=0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger=1
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_auto_hover=''
"let g:cpp_no_function_highlight = 1

"Window size async
let g:asyncrun_open = 12
let g:asuncrun_bell = 1

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
"Note that this line requires the build.sh script!
autocmd filetype cpp nnoremap <F9> :w <bar> AsyncRun build.sh %:r <CR> 
autocmd filetype cpp nnoremap <F10> :vertical terminal ++shell ++cols=50 ./%:r<CR>
"autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
autocmd filetype cpp nnoremap <F5> :%y+<CR>
