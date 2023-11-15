return {
  -- messages, cmdline and the popupmenu
  {
    'folke/noice.nvim',
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd('FocusLost', {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = 'notify_send',
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = 'split',
          opts = { enter = true, format = 'details' },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(event)
          vim.schedule(function()
            require('noice.text.markdown').keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 5000,
    },
  },

  -- animations
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
    },
    opts = {
      options = {
        mode = 'tabs',
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        -- globalstatus = false,
        theme = 'solarized_dark',
      },
    },
  },

  -- filename
  {
    'b0o/incline.nvim',
    dependencies = { 'craftzdog/solarized-osaka.nvim' },
    event = 'BufReadPre',
    priority = 1200,
    config = function()
      local colors = require('solarized-osaka.colors').setup()
      require('incline').setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if vim.bo[props.buf].modified then
            filename = '[+] ' .. filename
          end

          local icon, color = require('nvim-web-devicons').get_icon_color(filename)
          return { { icon, guifg = color }, { ' ' }, { filename } }
        end,
      })
    end,
  },

  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = '+2' },
      },
    },
    keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function(_, opts)
      local logo = [[
	  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
	  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
	  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
	  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
	  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
	  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

               |☠️ |
      /^v^\        |    |    |
                  )_)  )_)  )_)     /^v^\
       /^v^\     )___))___))___)\
                 )____)____)____)\\
              _____|____|____|____\\__
              \                   /
    ^^^^^ ^^^^^^^^  ^^^^^ ^^^^^  ^^^^^ ^^^^ <><
      ^^^^  ^^  ^^^    ^ ^^^    ^^^ <>< ^^><> ^
      ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'
      opts.config.header = vim.split(logo, '\n')
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          enbale_git_status = true,
          sort_function = function(a, b)
            if a.type == b.type then
              return a.path > b.path
            else
              return a.type > b.type
            end
          end, -- this sorts files and directories descendantly
        },
        window = { position = 'left' },
      },
    },
  },

  -- scrollbar
  { 'lewis6991/satellite.nvim', opts = {}, event = 'VeryLazy', enabled = false },
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
  -- floating winbar
  -- {
  --   'b0o/incline.nvim',
  --   event = 'BufReadPre',
  --   enabled = true,
  --   config = function()
  --     local colors = require('tokyonight.colors').setup()
  --     require('incline').setup({
  --       highlight = {
  --         groups = {
  --           InclineNormal = { guibg = '#FB617E', guifg = colors.black },
  --           InclineNormalNC = { guifg = '#FB617E', guibg = colors.black },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 1 } },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
  --         local icon, color = require('nvim-web-devicons').get_icon_color(filename)
  --         return { { icon, guifg = color }, { ' ' }, { filename } }
  --       end,
  --     })
  --   end,
  -- },
  -- Mini Map
  -- {
  --   'echasnovski/mini.map',
  --   main = 'mini.map',
  --   event = 'VeryLazy',
  --   enabled = false,
  --   config = function()
  --     local map = require('mini.map')
  --     map.setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.gitsigns(),
  --         map.gen_integration.diagnostic(),
  --       },
  --     })
  --     map.open()
  --   end,
  -- },
}
