-- plugins/vim-visual-multi.lua
-- Multi-cursor support

return {
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
  },
}
