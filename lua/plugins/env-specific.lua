-- plugins/env-specific.lua
-- Environment-specific plugins

return {
  -- Rust development tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    cond = function()
      return os.getenv("NEOVIM_ENVIRONMENT") == "rust-dev"
    end,
  },
  
  -- PHP development tools
  {
    "phpactor/phpactor",
    ft = "php",
    cond = function()
      return os.getenv("NEOVIM_ENVIRONMENT") == "php-dev"
    end,
    build = "composer install --no-dev -o",
  },
}
