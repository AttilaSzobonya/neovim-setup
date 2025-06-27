-- core/keymaps.lua
-- Core keymaps and mappings

local opts = { noremap = true, silent = true }

-- File explorer and telescope
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)

-- Custom navigation mappings
vim.api.nvim_set_keymap("n", "é", "$", opts)
vim.api.nvim_set_keymap("v", "é", "$", opts)
vim.api.nvim_set_keymap("n", "q", "0", opts)
vim.api.nvim_set_keymap("v", "q", "0", opts)

-- LSP keymaps
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
