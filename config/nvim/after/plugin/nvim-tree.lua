require('nvim-tree').setup {
  git = {
    ignore = false,
  },
}


-- Open NvimTree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Focus NvimTree
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':NvimTreeFocus<CR><C-w>p', { noremap = true, silent = true })

-- Reload NvimTree
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })

-- Change NvimTree width
vim.api.nvim_set_keymap('n', '<Leader>w', ':NvimTreeToggle<CR>:wincmd L<CR>', { noremap = true, silent = true })

-- Navigate NvimTree
vim.api.nvim_set_keymap('n', '<C-j>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':NvimTreeClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':NvimTreeOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':NvimTreeClose<CR>', { noremap = true, silent = true })

