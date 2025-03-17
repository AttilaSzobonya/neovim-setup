-- env/rust-dev.lua
-- Rust development specific configuration

local ok, rust_tools = pcall(require, "rust-tools")
if not ok then
  vim.notify("rust-tools.nvim not found. Please install it for Rust development.")
  return
end

rust_tools.setup({
  server = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
      },
    },
  },
})

