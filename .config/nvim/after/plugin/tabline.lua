
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    always_show_bufferline = false,
  },
})
