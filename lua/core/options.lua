-- core/options.lua
-- Core Neovim options and settings

-- Enable true color support
if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end

vim.opt.tabstop = 4       -- Show tabs as 4 spaces
vim.opt.shiftwidth = 4    -- Indent/outdent by 4 spaces
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.softtabstop = 4   -- When pressing <Tab>, insert 4 spaces

-- Enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ","
