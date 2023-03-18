-- Enable as many formatters as possible
vim.g.neoformat_enabled_python = { "autopep8", "black", "yapf" }
vim.g.neoformat_enabled_javascript = { "prettier", "eslint" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_css = { "prettier" }
vim.g.neoformat_enabled_yaml = { "prettier" }
vim.g.neoformat_enabled_markdown = { "prettier" }
vim.g.neoformat_enabled_json = { "prettier" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_cs = { "dotnet_format" }
vim.g.neoformat_enabled_java = { "google_java_format" }
vim.g.neoformat_enabled_c = { "clangformat" }

-- Format on save
vim.api.nvim_exec(
	[[
augroup NeoformatFormatOnSave
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
	false
)
