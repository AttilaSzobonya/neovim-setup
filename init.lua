-- ~/.config/nvim/init.lua
-- Packer startup function to manage plugins
require('packer').startup(function(use)
  -- Let packer manage itself
  use 'wbthomason/packer.nvim'

  -- LSP configurations
  use 'neovim/nvim-lspconfig'

  -- Optional: Additional Rust tools (e.g., inlay hints)
  use 'simrat39/rust-tools.nvim'

  -- Autocompletion framework
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Snippet engine and snippet collection
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Multi-cursor support (similar to VSCode)
  use 'mg979/vim-visual-multi'

  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons' -- Optional: for file icons

  use {
    'nvim-telescope/telescope.nvim', 
    requires = { 'nvim-lua/plenary.nvim' }
  }
end)

-- Set up nvim-cmp for autocompletion
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- For LuaSnip users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Configure rust-analyzer via nvim-lspconfig
local nvim_lsp = require('lspconfig')
nvim_lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true
      },
    }
  }
})

-- Set leader key to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,

  view = {
    width = 30,
    side = 'left',
    preserve_window_proportions = true,
  },

  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
    },
  },

  filters = {
    dotfiles = false, -- Change to `true` if you want to hide dotfiles
  },
}

-- Key mapping to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Set leader key to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,

  view = {
    width = 30,
    side = 'left',
    preserve_window_proportions = true,
  },

  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
    },
  },

  filters = {
    dotfiles = false, -- Change to `true` if you want to hide dotfiles
  },
}

-- Key mapping to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'é', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'é', '$', { noremap = true, silent = true }) -- Works in visual mode too
vim.api.nvim_set_keymap('n', 'q', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'q', '0', { noremap = true, silent = true }) -- Works in visual mode too

-- Enable relative line numbers
vim.o.number = true         -- Show absolute line number on the current line
vim.o.relativenumber = true -- Show relative numbers for other lines

