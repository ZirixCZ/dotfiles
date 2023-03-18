-- Keybindings for window navigation
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>w", ":WinSwap<CR>", { noremap = true })
