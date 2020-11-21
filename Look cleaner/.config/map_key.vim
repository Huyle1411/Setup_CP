"Settings for youcompleteme
let g:ycm_enable_diagnostic_signs=0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:asyncrun_open = 11

nnoremap <silent> <Leader>yy :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>y: :YcmCompleter<Space>

"Use tab to switch buffers
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab>   :bn<CR>

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

tnoremap <silent> <C-[><C-[> <C-\><C-n>

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

let g:AutoPairsShortcutToggle = '<F3>'

call togglebg#map("<F2>")
map <F7> :NERDTreeToggle<CR>

"Map key for compile and run code
autocmd filetype cpp nnoremap <silent> <F9> :w <bar> AsyncRun g++ -g -std=c++17 -D_DEBUG -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion %:r.cpp -o %:r<CR>
autocmd filetype python nnoremap <F9> :w <bar> !start cmd /c py % & pause<CR>
autocmd filetype cpp nnoremap <F10> :!start cmd /c %:r & pause <CR>
autocmd filetype cpp nnoremap <F5> :%y+<CR>
