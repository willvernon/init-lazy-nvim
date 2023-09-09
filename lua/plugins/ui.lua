return {
  {
    'folke/edgy.nvim',
    event = 'VeryLazy',
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = 'screen'
    end,
    opts = {
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = 'toggleterm',
          size = { height = 0.3 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ''
          end,
        },
        {
          ft = 'lazyterm',
          title = 'LazyTerm',
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        'Trouble',
        { ft = 'qf', title = 'QuickFix' },
        {
          ft = 'help',
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == 'help'
          end,
        },
        { ft = 'spectre_panel', size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = 'Neo-Tree',
          ft = 'neo-tree',
          filter = function(buf)
            return vim.b[buf].neo_tree_source == 'filesystem'
          end,
          size = { height = 0.7 },
        },
        {
          title = 'Neo-Tree Git',
          ft = 'neo-tree',
          filter = function(buf)
            return vim.b[buf].neo_tree_source == 'git_status'
          end,
          pinned = true,
          open = 'Neotree position=right git_status',
        },
        {
          title = 'Neo-Tree Buffers',
          ft = 'neo-tree',
          filter = function(buf)
            return vim.b[buf].neo_tree_source == 'buffers'
          end,
          pinned = false,
          open = 'Neotree position=top buffers',
        },
        {
          ft = 'Outline',
          pinned = true,
          open = 'SymbolsOutlineOpen',
        },
        -- any other neo-tree windows
        'neo-tree',
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

  -- auto-resize windows
  {
    'anuvyklack/windows.nvim',
    event = 'WinNew',
    dependencies = {
      { 'anuvyklack/middleclass' },
      { 'anuvyklack/animation.nvim', enabled = false },
    },
    keys = { { '<leader>wm', '<cmd>WindowsMaximize<cr>', desc = 'Zoom' } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require('windows').setup({
        animation = { enable = false, duration = 150 },
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

  -- style windows with different colorschemes
  {
    'folke/styler.nvim',
    event = 'VeryLazy',
    opts = {
      themes = {
        markdown = { colorscheme = 'catppuccin' },
        help = { colorscheme = 'catppuccin', background = 'dark' },
      },
    },
  },

  -- silly drops
  {
    'folke/drop.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = function()
      math.randomseed(os.time())
      -- local theme = ({ "stars", "snow" })[math.random(1, 3)]
      require('drop').setup({ theme = 'spring' })
    end,
  },

  -- lualine
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, {
  --       function()
  --         return require('util.dashboard').status()
  --       end,
  --     })
  --   end,
  -- },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
}
