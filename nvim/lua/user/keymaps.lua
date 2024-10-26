local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- NOTE: require winshit plugin
keymap("n", "<C-W>m", ":WinShift<cr>", opts)

keymap("n", "<S-Tab>", "<C-6>", opts)
-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)
-- exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)
-- delete cur buffer
keymap("n", "<leader>d", ":Bdelete<cr>", opts)
keymap("n", "<leader>D", ":Bdelete<cr>", opts)
-- exit whole program
keymap("n", "ZZ", ":lua require('user.utils').SaveAndExit()<cr>", opts)
-- remap macro record key
keymap("n", "Q", "q", opts)
-- cancel q
keymap("n", "q", "<Nop>", opts)

-- center cursor
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
-- keymap("n", "j", "jzz", opts)
-- keymap("n", "k", "kzz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "R", ":BufferLineCycleNext<CR>", opts)
keymap("n", "E", ":BufferLineCyclePrev<CR>", opts)

-- Navigate line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Insert --
-- Press jl fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- bookmark's
-- keymap("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "ma", "<cmd>Telescope vim_bookmarks all<cr>", opts)

-- lsp
keymap("", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
keymap("", "<A-2>", "<cmd>Outline<cr>", opts)
keymap("", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

keymap("n", ":", "<cmd>FineCmdline<cr>", opts)

-- for spell check
vim.cmd(
    [[
  nnoremap <leader>s :call search('\w\>', 'c')<CR>a<C-X><C-S>
]])
