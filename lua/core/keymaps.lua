-- core/keymaps.lua
-- Core keymaps and mappings

local opts = { noremap = true, silent = true }

-- Terminal toggle function that preserves terminal buffer
local function toggle_terminal()
  local bufnr = vim.fn.bufnr("term://")
  if bufnr ~= -1 and vim.fn.bufwinnr(bufnr) ~= -1 then
    -- Terminal is visible, hide it
    local win_count = vim.fn.winnr('$')
    if win_count > 1 then
      -- There are other windows, safe to hide
      vim.cmd("hide")
    else
      -- This is the only window, switch to another buffer instead
      vim.cmd("enew")
    end
  else
    -- Terminal is not visible, show it
    if bufnr ~= -1 then
      -- Terminal buffer exists but not visible, show existing buffer
      vim.cmd("sbuffer " .. bufnr)
    else
      -- No terminal buffer exists, create new one
      vim.cmd("terminal")
    end
  end
end

-- File explorer and telescope
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)

-- Custom navigation mappings
vim.api.nvim_set_keymap("n", "é", "$", opts)
vim.api.nvim_set_keymap("v", "é", "$", opts)
vim.api.nvim_set_keymap("n", "q", "0", opts)
vim.api.nvim_set_keymap("v", "q", "0", opts)

-- Terminal keymaps (Hungarian keyboard friendly)
vim.keymap.set("n", "<F12>", toggle_terminal, opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- LSP keymaps
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
