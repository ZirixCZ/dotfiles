local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>sw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "find existing buffers" })
