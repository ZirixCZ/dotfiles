-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

local chatgpt = require("chatgpt").setup({
  integration = "ollama",
  openai = {
    max_tokens = 100,
    model = "gpt-3.5-turbo-0125",
  },
  ollama = {
    model = "curiosity",
  },
})

vim.api.nvim_create_user_command("Gpt", function(input)
  chatgpt.router(input.args)
end, { nargs = "+" })

vim.api.nvim_create_user_command("GptKey", function(input)
  chatgpt.save_api_key_to_file(input.args)
end, { nargs = 1 })

vim.o.background = "dark"
