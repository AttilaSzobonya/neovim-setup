-- env/php-dev.lua
-- PHP development specific configuration

-- env/php-dev.lua
local lspconfig = require("lspconfig")

-- PHP: Use phpactor
lspconfig.phpactor.setup({
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  root_dir = lspconfig.util.root_pattern("composer.json", ".git", "index.php"),
  single_file_support = true,
})

-- HTML
lspconfig.html.setup({
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    provideFormatter = true,
  },
})

-- CSS
lspconfig.cssls.setup({
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

-- JavaScript/TypeScript (Updated from tsserver to ts_ls)
lspconfig.ts_ls.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
})

-- ESLint for JS/TS
lspconfig.eslint.setup({
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  settings = {
    validate = "on",
    lintTask = { enable = true },
    format = { enable = true },
  },
})

-- Auto-format on save using Prettier
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.php,*.html,*.js,*.ts,*.css,*.scss lua vim.lsp.buf.format()
  augroup END
]]

