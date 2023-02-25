local map = vim.keymap

-- leader key
vim.g.mapleader = " "

--general keymaps 

--jk exit insert mode
map.set("i", "jk", "<ESC>")

map.set("n", "<C-t>", ":tabnew<CR>")
map.set("n", "<tab>", ":tabn<CR>")
map.set("n", "<S-tab>", ":tabp<CR>")
map.set("n", "<C-w>", ":tabclose<CR>")
map.set("n", "<C-s>", ":w<CR>")
map.set("n", "x", '"_x"')

-- Plugin Key Maps

-- Mzximize the current window
map.set("n", "<leader>mm", ":MaximizerToggle<CR>")

-- Toggle file explorer
map.set("n","<C-f>", ":NvimTreeToggle<CR>")

-- Telescope keybindings
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags


------------------------------------------------------------------------------------------------------
-- disable arrow keys
------------------------------------------------------------------------------------------------------
local keymap = vim.api.nvim_set_keymap

--  on Normal Mode
local opts = { noremap = true, silent = true }
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

--  on Insert Mode
keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)

