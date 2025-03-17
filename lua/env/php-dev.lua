-- env/php-dev.lua
-- PHP development specific configuration

local lspconfig = require("lspconfig")

lspconfig.phpactor.setup({
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
})

