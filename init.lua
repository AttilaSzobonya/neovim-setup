-- init.lua
-- Main entry point for Neovim configuration

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure core settings before loading plugins
require("core.options")
require("core.keymaps")

-- Setup lazy.nvim with plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})

-- Load environment-specific configuration based on NEOVIM_ENVIRONMENT
local env = os.getenv("NEOVIM_ENVIRONMENT")

-- Normalize environment: treat unset, empty, or "general-dev" as equivalent
if not env or env == "" or env == "general-dev" then
  -- Load general-dev configuration for all these cases
  local ok, err = pcall(require, "env.general-dev")
  if not ok then
    vim.notify("Error loading general development configuration:\n" .. err, vim.log.levels.ERROR)
  end
else
  -- Load specific environment configuration
  local ok, err = pcall(require, "env." .. env)
  if not ok then
    vim.notify("Error loading environment configuration for " .. env .. ":\n" .. err, vim.log.levels.ERROR)
    -- Fallback to general-dev if specific environment fails
    local fallback_ok, fallback_err = pcall(require, "env.general-dev")
    if fallback_ok then
      vim.notify("Falling back to general development configuration", vim.log.levels.WARN)
    end
  else
    vim.notify("Loaded environment configuration: " .. env, vim.log.levels.INFO)
  end
end

