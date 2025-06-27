-- plugins/colorscheme.lua
-- Color scheme configuration

return {
  {
    "morhetz/gruvbox",
    priority = 1000, -- Load colorscheme first
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
