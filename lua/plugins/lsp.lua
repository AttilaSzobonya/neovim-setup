-- plugins/lsp.lua
-- LSP configuration

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- This will be configured by environment-specific files
    end,
  },
}
