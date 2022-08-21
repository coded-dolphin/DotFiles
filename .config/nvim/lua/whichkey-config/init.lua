local wk = require("which-key")
local mappings = {
  q = {":wq<cr>", "Save & Quit"},
  Q = {":q<cr>", "Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<Cr>", "Kill buffer"},
  E = {":e ~/.config/nvim/init.lua<Cr>", "Edit config"},
  }

local opts = {prefix = '<leader>'}


wk.register(mappings, opts)
