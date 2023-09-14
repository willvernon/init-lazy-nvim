return {
  -- {
  --   'lukas-reineke/virt-column.nvim',
  --   opts = {},
  -- },
  {
    'm4xshen/smartcolumn.nvim',
    opts = {
      colorcolumn = '120',
      disabled_filetypes = {
        'netrw',
        'NvimTree',
        'Lazy',
        'mason',
        'help',
        'text',
        'markdown',
        'tex',
        'html',
      },
      scope = 'window',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'sonokai',
        globalstatus = true,
      },
      sections = {
        lualine_c = {},
      },
    },
    init = function()
      vim.opt.showmode = false
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        separator_style = 'slant',
        mode = 'tabs',
        offsets = {
          {
            filetype = 'NvimTree',
            text = ' File Explorer',
            highlight = 'Directory',
            separator = false,
          },
        },
      },
    },
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
  -- { 'nvim-lualine/lualine.nvim',
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- optional = true,
  -- event = 'VeryLazy',
  -- opts = function(_, opts)
  --   local Util = require('lazyvim.util')
  --   local colors = {
  --     [''] = Util.fg('Special'),
  --     ['Normal'] = Util.fg('Special'),
  --     ['Warning'] = Util.fg('DiagnosticError'),
  --     ['InProgress'] = Util.fg('DiagnosticWarn'),
  --   }
  --   table.insert(opts.sections.lualine_x, 2, {
  --     function()
  --       local icon = require('lazyvim.config').icons.kinds.Copilot
  --       local status = require('copilot.api').status.data
  --       return icon .. (status.message or '')
  --     end,
  --     cond = function()
  --       local ok, clients =
  --         pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
  --       return ok and #clients > 0
  --     end,
  --     color = function()
  --       if not package.loaded['copilot'] then
  --         return
  --       end
  --       local status = require('copilot.api').status.data
  --       return colors[status.status] or colors['']
  --     end,
  --   })
  -- end,
  -- }i,
}
