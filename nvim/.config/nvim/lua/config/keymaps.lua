-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Make x always cut to _
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete without yanking" })
-- Unbind default keywordprg
vim.keymap.del("n", "<leader>K")
-- Rebind end of line
vim.keymap.set({ "n", "v", "o" }, "-", "$", { desc = "End of line" })
