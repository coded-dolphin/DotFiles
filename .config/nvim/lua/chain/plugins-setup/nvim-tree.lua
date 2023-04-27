-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require 'nvim-tree'.setup {

  filters = {dotfiles = false},

  view = {width = 30},

  update_cwd = true,
  update_focused_file = {
      enable = true,
      update_cwd = false,
    },

  renderer = {
  add_trailing = false,
  group_empty = false,
  highlight_git = false,
  full_name = false,
  highlight_opened_files = 'none',
  root_folder_modifier = ':~',
  indent_width = 2,
  indent_markers = {
    enable = true,
    inline_arrows = false,
    icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " ", },
  },

 icons = {
  webdev_colors = true,
  show = {file = true,
          folder = true,
          folder_arrow = false,},
 },
 },

}
vim.cmd [[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
