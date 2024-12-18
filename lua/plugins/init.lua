return {
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^0', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "nvim-tree/nvim-tree",
    enabled = false,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    }
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup({
        columns = { "icon" },
        view_options = {
          show_hidden = true,
        }
      })
      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>")
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      config = function()
        require "configs.lspconfig"
        require "custom.configs.lspconfig"
      end
    }
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "rust",
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
      require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },
  -- {
  --   "rktjmp/lush.nvim",
  --   -- if you wish to use your own colorscheme:
  --   -- { dir = '/absolute/path/to/colorscheme', lazy = true },
  --   lazy = false,
  -- }
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    lazy = false,
    ft = "markdown",
  },
  {
    'hat0uma/csvview.nvim',
    lazy = false,
    ft = "csv",
    config = function()
      require('csvview').setup(
        {
          parser = {
            --- The number of lines that the asynchronous parser processes per cycle.
            --- This setting is used to prevent monopolization of the main thread when displaying large files.
            --- If the UI freezes, try reducing this value.
            --- @type integer
            async_chunksize = 50,

            --- The delimiter character
            --- You can specify a string, a table of delimiter characters for each file type, or a function that returns a delimiter character.
            --- e.g:
            ---  delimiter = ","
            ---  delimiter = function(bufnr) return "," end
            ---  delimiter = {
            ---    default = ",",
            ---    ft = {
            ---      tsv = "\t",
            ---    },
            ---  }
            --- @type string | {default: string, ft: table<string,string>} | fun(bufnr:integer): string
            delimiter = {
              default = ",",
              ft = {
                tsv = "\t",
              },
            },
            view = {
              --- minimum width of a column
              --- @type integer
              min_column_width = 5,

              --- spacing between columns
              --- @type integer
              spacing = 2,

              --- The display method of the delimiter
              --- "highlight" highlights the delimiter
              --- "border" displays the delimiter with `│`
              --- see `Features` section of the README.
              ---@type "highlight" | "border"
              display_mode = "highlight",
            },
          }
        }
      )
    end
  }
}
