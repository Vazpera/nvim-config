vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  {
    "NvChad/base46",
    enable = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  -- {
  --   "rktjmp/lush.nvim",
  --   -- if you wish to use your own colorscheme:
  --   { dir = '~/vazpera-scheme/', lazy = true },
  --   lazy = false,
  -- },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require('render-markdown').setup({
   heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how icons fill the available space:
        --  inline:  underlying '#'s are concealed resulting in a left aligned icon
        --  overlay: result is left padded with spaces to hide any additional '#'
        position = 'overlay',
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the list using a cycle
        icons = { '|-', '|=', '|-', '|=', '|-', '|=' },
        -- Added to the sign column if enabled
        -- The 'level' is used to index into the list using a cycle
        signs = { '->', '=>', '->', '=>', '->', '=>' },
        -- Width of the heading background:
        --  block: width of the heading text
        --  full:  full width of the window
        -- Can also be a list of the above values in which case the 'level' is used
        -- to index into the list using a clamp
        width = 'full',
        -- Amount of margin to add to the left of headings
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        -- Margin available space is computed after accounting for padding
        -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        left_margin = 0,
        -- Amount of padding to add to the left of headings
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        left_pad = 0,
        -- Amount of padding to add to the right of headings when width is 'block'
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        right_pad = 0,
        -- Minimum width to use for headings when width is 'block'
        -- Can also be a list of integers in which case the 'level' is used to index into the list using a clamp
        min_width = 0,
        -- Determins if a border is added above and below headings
        border = false,
        -- Alway use virtual lines for heading borders instead of attempting to use empty lines
        border_virtual = false,
        -- Highlight the start of the border using the foreground highlight
        border_prefix = false,
        -- Used above heading for border
        above = '▄',
        -- Used below heading for border
        below = '▀',
        -- The 'level' is used to index into the list using a clamp
        -- Highlight for the heading icon and extends through the entire line
        backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
        },
        -- The 'level' is used to index into the list using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
        },
    },
    -- Mimic org-indent-mode behavior by indenting everything under a heading based on the

    -- level of the heading. Indenting starts from level 2 headings onward.
    indent = {
        -- Turn on / off org-indent-mode
        enabled = true,
        -- Amount of additional padding added for each heading level
        per_level = 2,
        -- Heading levels <= this value will not be indented
        -- Use 0 to begin indenting from the very first level
        skip_level = 1,
        -- Do not indent heading titles, only the body
        skip_heading = false,
    },
})
