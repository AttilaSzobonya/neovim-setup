-- plugins/telescope.lua
-- Fuzzy finder configuration

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
