return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- floating winbar
  {
    'b0o/incline.nvim',
    event = 'BufReadPre',
    enabled = true,
    config = function()
      local colors = require('tokyonight.colors').setup()
      require('incline').setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = '#FB617E', guifg = colors.black },
            InclineNormalNC = { guifg = '#FB617E', guibg = colors.black },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          local icon, color = require('nvim-web-devicons').get_icon_color(filename)
          return { { icon, guifg = color }, { ' ' }, { filename } }
        end,
      })
    end,
  },
  -- scrollbar
  { 'lewis6991/satellite.nvim', opts = {}, event = 'VeryLazy', enabled = false },
  {
    'echasnovski/mini.map',
    main = 'mini.map',
    event = 'VeryLazy',
    enabled = false,
    config = function()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
      })
      map.open()
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',
    enabled = true,
    config = function()
      local scrollbar = require('scrollbar')
      local colors = require('tokyonight.colors').setup()
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { 'prompt', 'TelescopePrompt', 'noice', 'notify' },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    theme = 'catppuccin',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
  },
  {
    'm4xshen/smartcolumn.nvim',
    opts = {
      colorcolumn = '100',
      disabled_filetypes = {
        'netrw',
        'NvimTree',
        'Lazy',
        'mason',
        'help',
        'text',
        'tex',
      },
      scope = 'window',
    },
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = 'v3.*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   opts = {
  --     options = {
  --       separator_style = 'slant',
  --       mode = 'tabs',
  --       offsets = {
  --         {
  --           filetype = 'NvimTree',
  --           text = ' File Explorer',
  --           highlight = 'Directory',
  --           separator = false,
  --         },
  --       },
  --     },
  --   },
  -- },
}
