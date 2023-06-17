vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.cmd("colorscheme nightfox")
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

vim.opt.list = true
vim.opt.listchars = "tab:→ ,eol:¬,space:·,trail:•,extends:⟩,precedes:⟨"

vim.api.nvim_set_keymap("n", "<leader>z", ":set list!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sm", "<cmd>Telescope media_files<CR>", { noremap = true, silent = true })

local isEnabled = true
function diagnostic_toggle()
	if isEnabled then
		vim.diagnostic.hide()
		isEnabled = false
	else
		vim.diagnostic.show()
		isEnabled = true
	end
end

vim.keymap.set("n", "<leader>l", function()
	diagnostic_toggle()
end, { noremap = true, silent = true })
