return {
  -- For Eslint I've got to enable it in :LazyExtras
  -- COLOR SCHEME/THEME
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          all = {
            -- base = "#282c34",
            -- mantle = "#353b45",
            -- surface0 = "#3e4451",
            -- surface1 = "#545862",
            -- surface2 = "#565c64",
            -- text = "#abb2bf",
            -- rosewater = "#b6bdca",
            -- lavender = "#c8ccd4",
            -- red = "#e06c75",
            -- peach = "#d19a66",
            -- yellow = "#e5c07b",
            -- green = "#c9e6b3",
            -- teal = "#56b6c2",
            -- blue = "#5896FE",
            -- mauve = "#f4a994",
            -- flamingo = "#be5046",
            --
            -- -- now patching extra palettes
            -- maroon = "#e06c75",
            -- sky = "#d19a66",
            --
            -- -- extra colors not decided what to do
            -- pink = "#F5C2E7",
            -- sapphire = "#74C7EC",
            --
            -- subtext1 = "#BAC2DE",
            -- subtext0 = "#A6ADC8",
            -- overlay2 = "#9399B2",
            -- overlay1 = "#7F849C",
            -- overlay0 = "#6C7086",
            --
            -- crust = "#11111B",
          },
        },
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end,
  },

  -- LATEX
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "skim" -- Use Skim PDF viewer on macOS
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build", -- Change as needed
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }
    end,
  }, -- DEV
  { "MunifTanjim/nui.nvim" },
  {
    "ZirixCZ/nvimai",
    opts = {
      integration = "ollama",
      openai = {
        model = "gpt-3.5-turbo-0125",
        max_tokens = 100,
      },
      ollama = {
        model = "curiosity",
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },

  { "nyoom-engineering/oxocarbon.nvim" },

  {
    "oahlen/iceberg.nvim",
  },

  {
    "rose-pine/neovim",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
          NormalFloat = { bg = "none" },
          -- Change "const" (and other keywords) to a custom color
          ["@keyword"] = { fg = "gold", bold = true }, -- Example: Change to gold
          Keyword = { fg = "love", bold = true }, -- Alternative way to change keywords
          ["@keyword.import"] = { fg = "gold", bold = true },
          ["@keyword.from"] = { fg = "gold", bold = true },
          ["@keyword.return"] = { fg = "gold", bold = true },
          ["@keyword.styles"] = { fg = "gold", bold = true },
        },
      })

      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-moon")
    end,
  },

  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      transparent = {
        enabled = true, -- Master switch to enable transparency
        pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
        normal = true, -- Main editor window background
        normalfloat = true, -- Floating windows
        neotree = true, -- Neo-tree file explorer
        nvimtree = true, -- Nvim-tree file explorer
        whichkey = true, -- Which-key popup
        telescope = true, -- Telescope fuzzy finder
        lazy = true, -- Lazy plugin manager UI
        mason = true, -- Mason manage external tooling
      },
    },
    config = function(_, opts)
      -- vim.o.termguicolors = true

      -- vim.o.background = "light"
      -- require("solarized").setup(opts)
      -- vim.cmd.colorscheme("solarized")
    end,
  },

  -- AI GEN

  -- Custom Parameters (with defaults)
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "dolphincoder", -- The default model to use.
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      quit_map = "q", -- set keymap for close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = "dolphincoder", stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    },
  },

  -- {
  --   "huggingface/llm.nvim",
  --   config = function()
  --     require("llm").setup({
  --       model = "zephyr",
  --       backend = "ollama",
  --       url = "http://localhost:11434/api/generate",
  --       -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
  --       request_body = {
  --         -- Modelfile options for the model you use
  --         options = {
  --           temperature = 0.2,
  --           top_p = 0.95,
  --         },
  --       },
  --       lsp = {
  --         bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
  --       },
  --     })
  --   end,
  -- },
  --

  -- NOTIFY

  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      background_colour = "#000000",
    },
  },

  -- TELESCOPE

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
          },
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.9, -- Increase overall width
            height = 0.9, -- Increase overall height
            preview_width = 0.4, -- Make the preview larger
          },
          path_display = { "truncate" },
        },
      })
    end,
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "Find Files (root dir)",
      },
      {
        "<leader>sw",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- LSP CONFIG
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
          vim.keymap.set("n", "<leader>cr", "TypescriptRename", { desc = "Rename", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        html = {},
        astro = {},
        svelte = {},
        tsserver = {},
        cssls = {},
        pyright = {},
        rust_analyzer = {},
        phpactor = {},
        texlab = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        wgsl = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.wgsl_analyzer.setup()
          return true
        end,

        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("flutter-tools").setup({})
    end,
  },

  -- TREESITTER

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "svelte",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "wgsl",
      },
    },
  },

  -- DISCORD PRESENCE
  -- {
  --   "SIGMazer/presence.nvim",
  --   config = function()
  --     require("presence").setup({
  --       -- General options
  --       auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  --       neovim_image_text = "Nerdy text editor", -- Text displayed when hovered over the Neovim image
  --       main_image = "https://i.imgur.com/Oyc9Ukl.jpeg", -- Main image display (either "neovim" or "file")
  --       client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
  --       log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  --       enable_line_number = false, -- Displays the current line number instead of the current project
  --       blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  --       buttons = false, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  --       file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  --       show_time = false, -- Show the timer
  --
  --       -- Rich Presence text options
  --       editing_text = "", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  --       file_explorer_text = "", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  --       git_commit_text = "", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  --       plugin_manager_text = "", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  --       reading_text = "", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  --       workspace_text = "", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  --       line_number_text = "",
  --     })
  --   end,
  -- },
  -- --  GITHUB COPILOT
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
    config = function()
      vim.keymap.set("i", "<C-e>", [[copilot#Accept("\<CR>")]], {
        silent = true,
        expr = true,
        script = true,
        replace_keycodes = false,
      })
    end,
  },

  -- COMMENTS
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  -- HARPOON
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
    },
  },

  -- PRETTIER
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
    },
  },

  -- phpactor
  {
    "phpactor/phpactor",
    init = function()
      vim.g.phpactor_phpactor_path = "/usr/local/bin/phpactor"
    end,
  },

  -- buferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right", width = 65 },
    },
  },

  {
    "hard-tender-blade/session-timer.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    config = function()
      require("session-timer").setup({
        sessionTimeSeconds = 2700, -- 45 minutes
        showSessionEndWindow = true,
        onSessionStart = function()
          --require("notify")("Session started", "info")
          -- if you dont use notify:
          vim.notify("Session started")
        end,
        onSessionEnd = function() end,
        onSessionKill = function()
          --require("notify")("Session killed", "info")
          -- if you dont use notify:
          vim.notify("Session killed")
        end,
        events = {
          {
            secondsBeforeSessionTimerEnds = 600, -- 10 minutes
            hook = function()
              -- require("notify")("Ending session in 10m", "info")
              -- if you dont use notify:
              vim.notify("Ending session in 10m")
            end,
          },
          {
            secondsBeforeSessionTimerEnds = 300, -- 5 minutes
            hook = function()
              --require("notify")("Ending session in 5m", "info")
              vim.notify("Ending session in 5m")
            end,
          },
          {
            secondsBeforeSessionTimerEnds = 3,
            hook = function()
              --require("notify")("Ending session in 3s", "info")
              vim.notify("Ending session in 3s")
            end,
          },
          {
            secondsBeforeSessionTimerEnds = 2,
            hook = function()
              --require("notify")("Ending session in 2s", "info")
              vim.notify("Ending session in 2s")
            end,
          },
          {
            secondsBeforeSessionTimerEnds = 1,
            hook = function()
              --require("notify")("Ending session in 1s", "info")
              vim.notify("Ending session in 1s")
            end,
          },
        },
      })
    end,
  },
}
