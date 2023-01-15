local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local lualine_nightfly = require("lualine.themes.nightfly")

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
  pink = "#f7768e",
  blue = "#65D1FF",
  green = "#9ece6a",
  violet = "#5a4a78",
  yellow = "#2ac3de",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.pink
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
})
