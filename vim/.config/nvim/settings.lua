-- remap the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- basic settings
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.o.updatetime=200
vim.o.ttimeoutlen=50

-- Display
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
-- vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
-- vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.wildmenu = true
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

vim.cmd([[
  let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
]])

vim.cmd([[
  au VimEnter * if !&diff | tab all | tabfirst | endif
  au GUIEnter * simalt ~x
  autocmd GUIEnter * set visualbell t_vb=
  autocmd VimEnter * set bufhidden=hide
  autocmd VimEnter * set vb t_vb=
  autocmd BufEnter * silent! lcd %:p:h

  autocmd BufNewFile *.cpp 0r /home/huyle/library/template.cpp
]])

vim.cmd([[
  function! Formatonsave()
    let l:formatdiff = 1
    py3f /usr/share/clang/clang-format-14/clang-format.py
  endfunction
  autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
]])



vim.o.background = 'dark'
vim.cmd('colorscheme dracula')
-- vim.cmd[[colorscheme dracula]]


----- Customize for vim-airlines -----"
vim.cmd([[
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
]])


vim.cmd([[
  highlight Cursor guifg=white guibg=green
  highlight iCursor guifg=white guibg=green
  set guicursor=n-v:block-Cursor
  set guicursor+=i-c:ver10-iCursor
  set guicursor+=n-v-c-i:blinkon0
  let g:ycm_enable_diagnostic_signs=1
  let g:ycm_enable_diagnostic_highlighting = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_auto_trigger=1
  let g:ycm_always_populate_location_list = 1
]])

vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')

vim.cmd([[
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
]])
