-- env/general-dev.lua
-- General development configuration (default environment)
-- This is loaded when NEOVIM_ENVIRONMENT is unset, empty, or set to "general-dev"

local lspconfig = require("lspconfig")

-- Basic language server configurations that are commonly available
-- These are minimal setups that don't require special installation

-- Lua Language Server (if available)
if vim.fn.executable("lua-language-server") == 1 then
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  })
end

-- JSON Language Server (if available)
if vim.fn.executable("vscode-json-language-server") == 1 then
  lspconfig.jsonls.setup({})
end

-- Bash Language Server (if available)
if vim.fn.executable("bash-language-server") == 1 then
  lspconfig.bashls.setup({})
end

-- Python Language Server (if available)
if vim.fn.executable("pylsp") == 1 then
  lspconfig.pylsp.setup({})
elseif vim.fn.executable("pyright") == 1 then
  lspconfig.pyright.setup({})
end

vim.notify("General development environment loaded - basic LSP support enabled", vim.log.levels.INFO)
