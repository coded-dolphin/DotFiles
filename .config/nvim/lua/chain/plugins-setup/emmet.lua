
-- import comment plugin safely
local setup, emmet = pcall(require, "emmet")
if not setup then
  return
end

-- enable comment
emmet.setup()
