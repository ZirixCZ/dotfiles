local colors = {
	background = "#161616",
	foreground = "#000000",
	accent = "#FF0000",
	type = "#D30C7B",
	white = "#FFFFFF",
}

vim.cmd("highlight Normal guibg=" .. colors.background .. " guifg=" .. colors.white)
vim.cmd("highlight Comment guifg=" .. colors.accent)
vim.cmd("highlight Type guifg=" .. colors.type)
vim.cmd("highlight Constant guifg=" .. colors.white)
vim.cmd("highlight jsxTag guifg=" .. colors.accent)
