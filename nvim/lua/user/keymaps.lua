local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<Enter>", "O<Esc>j", opts)
keymap("n", "Y", "y$", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("v", "p", '"_dP', opts) -- Paste and overwrite in visual mode

keymap("n", "Y", "y$", opts) -- Copy line
keymap("n", "``", "@:", opts) -- run last colon command
keymap("n", "<Leader>q", ":nohlsearch<CR>", opts) -- remove highlight from searches
keymap("n", "<Leader>sa", "gg^vG$", opts) -- run last colon command
keymap("n", "<Leader>r", ":so ~/.config/nvim/init.lua<CR>:nohlsearch<CR>", opts) -- reload
keymap("n", "vv", ":vsplit | b", opts) -- open vsplit
keymap("n", "vs", ":split | b", opts) -- open split

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
-- keymap("c", "<C-n>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
-- keymap("c", "<C-p>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

-- nvim-tree
keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>e", ":NvimTreeFindFile<CR>", opts)

-- fzf
-- vim.cmd "let g:fzf_layout = { 'down': '~30%' }"
vim.cmd("let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }")
keymap("n", "<Leader>f", ":Files<CR>", opts)
keymap("n", "<Leader>g", ":GitFiles<CR>", opts)
keymap("n", "<Leader>b", ":Buffers<CR>", opts)
keymap("n", "<Leader>a", ":Ag<space>", {})
keymap("n", "<C-p>", ":Ag <C-R><C-W><CR>", {})
-- vim.cmd([[
--   nnoremap <Leader>a :Ag<space>
-- ]])

-- Close all buffers
keymap("n", "<Leader>bd", ":BufOnly<CR>", opts)

-- Laygit
keymap("n", "<Leader>gg", ":LazyGit<CR>", opts)

vim.keymap.set("n", "<leader>cr", ':let @+=expand("%")<CR>', { desc = "[C]opy File [R]elative Path" })
vim.keymap.set("n", "<leader>cf", ':let @+=expand("%:p")<CR>', { desc = "[C]opy [F]ile Full Path" })
vim.keymap.set("n", "<leader>cd", ':let @+=expand("%:p:h")<CR>', { desc = "[C]opy File [D]irectory" })
vim.keymap.set("n", "<leader>cn", ':let @+=expand("%:t")<CR>', { desc = "[C]opy File[n]ame" })
