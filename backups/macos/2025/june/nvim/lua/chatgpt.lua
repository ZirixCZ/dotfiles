local Input = require("nui.input")
local Split = require("nui.split")
local event = require("nui.utils.autocmd").event

local mainWindow = Split({
  relative = "editor",
  position = "right",
  size = "45%",
})

local input = Input({
  position = "50%",
  size = {
    width = 20,
  },
  border = {
    style = "single",
    text = {
      top = "[NAI]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal",
  },
}, {
  prompt = "> ",
  default_value = "Hello",
  on_close = function()
    print("Input Closed!")
  end,
  on_submit = function(value)
    print("Input Submitted: " .. value)
  end,
})

local M = {}

local buffer = nil
local window = nil

---@class OpenAIConfig
---@field max_tokens number The maximum number of tokens to generate.
---@field model string The model to use for generation.

---@class OllamaConfig
---@field model string The model to use for queries.

---@class NvimAIConfig
---@field integration string The integration to use, can be 'openai' or 'ollama'.
---@field openai OpenAIConfig Configuration settings for OpenAI.
---@field ollama OllamaConfig Configuration settings for Ollama.

---Configurations for Nvim AI setup
---@type NvimAIConfig
local config = {
  integration = "openai",
  openai = {
    max_tokens = 1000,
    model = "gpt-3.5-turbo-0125",
  },
  ollama = {
    model = "llama2",
  },
}

function M.setup(options)
  if options then
    for key, value in pairs(options) do
      if config[key] ~= nil and type(config[key]) == "table" then
        for sub_key, sub_value in pairs(value) do
          config[key][sub_key] = sub_value
        end
      else
        config[key] = value
      end
    end
  end

  return M
end

function M.save_api_key_to_file(api_key)
  local path = vim.fn.stdpath("data") .. "/nvimai.txt"
  vim.fn.writefile({ api_key }, path)
end

function M.load_api_key_from_file()
  local path = vim.fn.stdpath("data") .. "/nvimai.txt"
  if vim.fn.filereadable(path) == 1 then
    local lines = vim.fn.readfile(path)
    if #lines > 0 then
      return lines[1]
    end
  end
  return nil
end

function M.save_buffer_to_file()
  local path = vim.fn.stdpath("data") .. "/nvimai.txt"
  if buffer and vim.api.nvim_buf_is_valid(buffer) then
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
    vim.fn.writefile(lines, path)
  end
end

function M.load_buffer_from_file()
  local path = vim.fn.stdpath("data") .. "/nvimai.txt"
  if vim.fn.filereadable(path) == 1 then
    local lines = vim.fn.readfile(path)
    if not buffer or not vim.api.nvim_buf_is_valid(buffer) then
      buffer = vim.api.nvim_create_buf(true, false)
      vim.api.nvim_buf_set_option(buffer, "bufhidden", "hide")
    end
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
  end
end

function M.extract_language_and_code(content)
  local lang_pattern = "```([a-zA-Z0-9_]+)[\n\r]"
  local code_pattern = "```[a-zA-Z0-9_]+[\n\r](.-)```"

  local language = content:match(lang_pattern)
  local code = content:match(code_pattern)

  if code then
    code = code:gsub("^%s+", ""):gsub("%s+$", "")
  end

  return language or "text", code or content
end

function M.open_window(content, filetype, tokens, model)
  if buffer == nil or not vim.api.nvim_buf_is_valid(buffer) then
    buffer = vim.api.nvim_create_buf(true, false)
  end

  vim.api.nvim_buf_set_option(buffer, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buffer, "bufhidden", "hide")
  vim.api.nvim_buf_set_option(buffer, "swapfile", false)

  local line_count = vim.api.nvim_buf_line_count(buffer)
  if line_count == 1 then
    line_count = 0
  end

  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local header = "-- " .. timestamp .. " --"
  local model = "-- " .. model .. " --"
  local token_info = "-- tokens used: " .. tokens .. " --"

  local new_content = vim.split(content, "\n")

  local formatted_content = { header, token_info, model, "" }
  for _, line in ipairs(new_content) do
    table.insert(formatted_content, line)
  end
  table.insert(formatted_content, "")

  vim.api.nvim_buf_set_lines(buffer, line_count, -1, false, formatted_content)
  vim.api.nvim_buf_set_option(buffer, "filetype", filetype or "text")

  if window == nil or not vim.api.nvim_win_is_valid(window) then
    mainWindow.bufnr = buffer
  else
    mainWindow.bufnr = buffer
    mainWindow.winid = window
  end

  mainWindow:mount()
  input:mount()
  M.save_buffer_to_file()
end

function M.openai(input)
  M.load_buffer_from_file()
  local api_key = M.load_api_key_from_file()
  local model = config.openai.model
  local max_tokens = config.openai.max_tokens

  if type(api_key) ~= "string" then
    local setupMessage = [[
No API key found. Please set it up with:
:NAISetup yourapikey
    ]]
    M.open_window(setupMessage, "", 0, config.openai.model)
    return
  end

  local data = string.format(
    '{"model": "%s", "max_tokens": %d, "messages": [{"role": "user", "content": "%s"}]}',
    model,
    max_tokens,
    input
  )

  vim.fn.jobstart({
    "curl",
    "-s",
    "-X",
    "POST",
    "-H",
    "Content-Type: application/json",
    "-H",
    "Authorization: Bearer " .. api_key,
    "--data",
    data,
    "https://api.openai.com/v1/chat/completions",
  }, {
    stdout_buffered = true,

    on_stdout = function(_, data, _)
      if data then
        local response = table.concat(data, "")
        local decoded = vim.fn.json_decode(response)
        if decoded.choices and decoded.choices[1] then
          local message = decoded.choices[1].message.content
          local tokens = decoded.usage.total_tokens
          if message then
            local language, code = M.extract_language_and_code(message)
            M.open_window(code, language, tokens, config.openai.model)
          else
            M.open_window("Received an unexpected structure from API.", "", 0, config.openai.model)
          end
        else
          M.open_window("No choices returned from API.", "", 0, config.openai.model)
        end
      end
    end,
    on_stderr = function(_, data, _)
      if data then
        for _, line in ipairs(data) do
          print("stderr line:", line)
        end

        local all_lines = table.concat(data, "")
        if all_lines ~= "" then
          local error_message = "Error: " .. all_lines
          M.open_window(error_message, "", 0, config.openai.model)
        end
      end
    end,
  })
end

function M.ollama(input)
  M.load_buffer_from_file()

  local data = string.format('{"model": "%s", "prompt": "%s"}', config.ollama.model, input)
  local buffer = {}

  vim.fn.jobstart({
    "curl",
    "-s",
    "-X",
    "POST",
    "-H",
    "Content-Type: application/json",
    "--data",
    data,
    "--connect-timeout",
    "30",
    "--max-time",
    "3600",
    "http://localhost:11434/api/generate",
  }, {
    stdout_buffered = true,
    on_stdout = function(_, data, _)
      if data then
        for _, chunk in ipairs(data) do
          table.insert(buffer, chunk)
        end
      end
      if #data == 0 or data[#data] == "" then
        local message = ""
        for _, line in ipairs(buffer) do
          if line and line ~= "" then
            if line:sub(1, 1) == "{" and line:sub(-1) == "}" then
              local status, decoded_line = pcall(vim.fn.json_decode, line)
              if status and decoded_line then
                message = message .. decoded_line.response
              end
            end
          end
        end
        local language, code = M.extract_language_and_code(message)
        M.open_window(code, language, -1, config.ollama.model)
      end
    end,
    on_stderr = function(_, data, _)
      if data then
        local all_lines = table.concat(data, "")
        if all_lines ~= "" then
          local error_message = "Error: " .. all_lines
          M.open_window(error_message, "", 0, config.ollama.model)
        end
      end
    end,
  })
end

function M.router(input)
  if config.integration == "openai" then
    M.openai(input)
  elseif config.integration == "ollama" then
    M.ollama(input)
  end
end

return M
