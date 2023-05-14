require("telescope").load_extension("dap")
require("config.dap.python")
require("config.dap.javascript")
require("config.dap.typescriptreact")

vim.g.dap_virtual_text = true

vim.keymap.set("n", "<leader>dct", '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set("n", "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set("n", "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set("n", "<leader>dso", '<cmd>lua require"dap".step_out()<CR>')
vim.keymap.set("n", "<leader>dtb", '<cmd>lua require"dap".toggle_breakpoint()<CR>')

vim.keymap.set("n", "<leader>dsc", '<cmd>lua require"dap.ui.variables".scopes()<CR>')
vim.keymap.set("n", "<leader>dhh", '<cmd>lua require"dap.ui.variables".hover()<CR>')
vim.keymap.set("v", "<leader>dhv", '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

vim.keymap.set("n", "<leader>duh", '<cmd>lua require"dap.ui.widgets".hover()<CR>')
vim.keymap.set(
	"n",
	"<leader>duf",
	"<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>"
)

vim.keymap.set("n", "<leader>dsbr", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set(
	"n",
	"<leader>dsbm",
	'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>'
)
vim.keymap.set("n", "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>')
vim.keymap.set("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>')

-- telescope-dap
vim.keymap.set("n", "<leader>dcc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
vim.keymap.set("n", "<leader>dco", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
vim.keymap.set("n", "<leader>dlb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
vim.keymap.set("n", "<leader>dv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
vim.keymap.set("n", "<leader>df", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

vim.keymap.set("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>")
vim.keymap.set("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>")
vim.keymap.set("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>")
vim.keymap.set("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>")
vim.keymap.set("n", "<Leader>dui", "<cmd>lua require'dapui'.toggle()<cr>")

-- Load dapui extension
require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})
