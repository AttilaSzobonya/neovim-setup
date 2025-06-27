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
if env and env ~= "" then
  local ok, err = pcall(require, "env." .. env)
  if not ok then
    vim.notify("Error loading environment configuration for " .. env .. ":\n" .. err, vim.log.levels.ERROR)
  else
    vim.notify("Loaded environment configuration: " .. env, vim.log.levels.INFO)
  end
else
  vim.notify("NEOVIM_ENVIRONMENT not set or empty. Only loading common configuration.", vim.log.levels.INFO)
end

