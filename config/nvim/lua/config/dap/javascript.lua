local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-js-debug"

local M = {}

function M.setup()
	require("dap-vscode-js").setup({
		node_path = "node",
		debugger_path = DEBUGGER_PATH,
		-- debugger_cmd = { "js-debug-adapter" },
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	})
	for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
		require("dap").configurations[language] = {
			{
				type = "pwa-chrome",
				name = "Attach - Remote Debugging",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
			{
				type = "pwa-chrome",
				name = "Launch Chrome",
				request = "launch",
				url = "http://localhost:3000",
			},
		}
	end
end

return M
