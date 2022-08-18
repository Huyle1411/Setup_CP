-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Map <CR> to :nohl, except in quickfix windows
vim.cmd([[nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"]])

--Compile and run
vim.opt.makeprg = "cd build && make"
keymap("n", "<F5>", ":%y+ <CR>", opts)
keymap("i", "<F5>", "<ESC> :%y+ <CR>", opts)
keymap("n", "<F8>", ":vert T cd build && ./%:r <CR>", opts)
keymap("n", "<F9>", ":w <bar> Make <CR>", opts)
keymap("i", "<F9>", "<ESC> :w <bar> Make <CR>", opts)
keymap("n", "<F10>", ":vert T h -t <CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- youcompleteme
keymap("n", "<leader>yy", ":YcmCompleter GoTo<CR>", opts)
keymap("n", "<leader>yr", ":YcmCompleter GoToReferences<CR>", opts)
keymap("n", "<leader>yd", ":YcmDiags<CR>", opts)
keymap("n", "<leader>yf", ":YcmCompleter FixIt<CR>", opts)
keymap("n", "<leader>y:", ":YcmCompleter<Space>", opts)
