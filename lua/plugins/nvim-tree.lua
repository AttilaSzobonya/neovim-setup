-- plugins/nvim-tree.lua
-- File explorer configuration

return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = true,
        },
        renderer = {
          icons = {
            show = {
              file         = false,
              folder       = false,
              folder_arrow = false,
              git          = false,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },
}
