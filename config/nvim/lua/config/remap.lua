vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.git_files({ hidden = true, no_ignore = true })<cr>", {})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
