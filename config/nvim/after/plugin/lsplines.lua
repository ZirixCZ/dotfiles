require("lsp_lines").setup()

vim.keymap.set("n", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
vim.diagnostic.config({ virtual_lines = false }) -- disable this plugin
