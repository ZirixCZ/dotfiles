if vim.g.vscode then
	require("config.remap")
else
	-- ordinary Neovim
	require("config.remap")
	require("config.set")
	require("config.dap")
end
