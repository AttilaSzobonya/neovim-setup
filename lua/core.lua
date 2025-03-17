-- core.lua
-- Common Neovim configuration

-- Enable true color support
if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end

vim.opt.tabstop = 4       -- Show tabs as 4 spaces
vim.opt.shiftwidth = 4    -- Indent/outdent by 4 spaces
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.softtabstop = 4   -- When pressing <Tab>, insert 4 spaces

require("packer").startup(function(use)
  -- Let packer manage itself
  use "wbthomason/packer.nvim"

  -- LSP configurations (common to all environments)
  use "neovim/nvim-lspconfig"

  -- Autocompletion framework and snippet support
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Multi-cursor support (like VSCode)
  use "mg979/vim-visual-multi"

  -- File explorer and icons
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"

  -- Telescope for fuzzy finding
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- Environment-specific plugins
  local env = os.getenv("NEOVIM_ENVIRONMENT")
  if env == "rust-dev" then
    use "simrat39/rust-tools.nvim"
  elseif env == "php-dev" then
    use "phpactor/phpactor"
  end
end)

-- Set up nvim-cmp for autocompletion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"]   = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"]    = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

-- General key mappings and options
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "é", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "é", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "q", "0", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

-- Enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- nvim-tree configuration
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

