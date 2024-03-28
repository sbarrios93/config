-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Easier Escape
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Do not replace register when pasting
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking" })
