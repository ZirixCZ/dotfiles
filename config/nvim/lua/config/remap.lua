vim.g.mapleader = " "

vim.keymap.set("n", "bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "bp", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.git_files({ hidden = true, no_ignore = true })<cr>",
	{}
)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
