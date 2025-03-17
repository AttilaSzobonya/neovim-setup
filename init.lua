-- init.lua
-- Main entry point for Neovim configuration

-- Load the common configuration
require("plugins")
require("core")

-- Load environment-specific configuration based on NEOVIM_ENVIRONMENT
local env = os.getenv("NEOVIM_ENVIRONMENT")
if env then
  local ok, err = pcall(require, "env." .. env)
  if not ok then
    vim.notify("Error loading environment configuration for " .. env .. ":\n" .. err)
  end
else
  vim.notify("NEOVIM_ENVIRONMENT not set. Only loading common configuration.")
end

