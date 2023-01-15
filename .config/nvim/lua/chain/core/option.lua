local set = vim.opt

--linenumbers
set.relativenumber = false
set.number = true

--tab & indentation
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true

-- line wrap
set.wrap = false

--search
set.ignorecase = true
set.smartcase = true

-- cursor line
set.cursorline = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- clipboard
set.clipboard:append("unnamedplus")

-- splits
set.splitbelow = true
set.splitright = true

