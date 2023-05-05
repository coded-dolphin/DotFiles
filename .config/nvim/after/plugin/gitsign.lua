-- import comment plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- enable gitsigns
gitsigns.setup()
