-- https://github.com/jascha030/macos-nvim-dark-mode
local os_is_dark = function()
  return (vim.call(
    'system',
    [[echo $(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo 'dark' || echo 'light')]]
  )):find('dark') ~= nil
end

return {
  -- Lazy
  {
    'loctvl842/monokai-pro.nvim',
    config = function()
      require('monokai-pro').setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = 'spectrum', -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = false, -- turn off by default
          day_filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = 'spectrum', -- classic | octagon | pro | machine | ristretto | spectrum
        },
        inc_search = 'background', -- underline | background
        background_clear = {
          -- "float_win",
          'toggleterm',
          'telescope',
          -- "which-key",
          'renamer',
          --'notify',
          'nvim-tree',
          'neo-tree',
          --'bufferline', -- better used if background of `neo-tree` or `nvim-tree` is cleared
        }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = 'default', -- default | pro
            context_start_underline = false,
          },
        },
      })
    end,
  },
  {
    'sainnhe/sonokai',
  },
  -- {
  --   'loctvl842/monokai-pro.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   keys = { { '<leader>um', '<cmd>MonokaiProSelect<cr>', desc = 'Select Moonokai pro filter' } },
  --   config = function()
  --     local monokai = require('monokai-pro')
  --     monokai.setup({
  --       transparent_background = true,
  --       devicons = true,
  --       filter = 'octagon', -- classic | octagon | pro | machine | ristretto | spectrum
  --       day_night = {
  --         enable = false,
  --         day_filter = 'octagon',
  --         night_filter = 'spectrum',
  --       },
  --       inc_search = 'background', -- underline | background
  --       background_clear = { 'nvim-tree', 'neo-tree', 'bufferline' },
  --       plugins = {
  --         bufferline = {
  --           underline_selected = true,
  --           underline_visible = true,
  --           underline_fill = true,
  --           bold = false,
  --         },
  --         indent_blankline = {
  --           context_highlight = 'pro', -- default | pro
  --           context_start_underline = true,
  --         },
  --       },
  --       override = function(c)
  --         return {
  --           ColorColumn = { bg = c.editor.background },
  --           -- Mine
  --           DashboardRecent = { fg = c.base.magenta },
  --           DashboardProject = { fg = c.base.blue },
  --           DashboardConfiguration = { fg = c.base.white },
  --           DashboardSession = { fg = c.base.green },
  --           DashboardLazy = { fg = c.base.cyan },
  --           DashboardServer = { fg = c.base.yellow },
  --           DashboardQuit = { fg = c.base.red },
  --           -- Codeium Icon
  --           CmpItemKindVariable = { fg = '#09B6A2' },
  --         }
  --       end,
  --     })
  --     monokai.load()
  --   end,
  -- },

  {
    -- https://github.com/catppuccin/nvim
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      transparent_background = true,
      integrations = {
        notify = true,
        mini = true,
      },
    },
  },
  {
    'LazyVim/LazyVim',
    opts = function(_, opts)
      if os_is_dark() then
        -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
        opts.colorscheme = 'sonokai'
      else
        opts.colorscheme = 'vscode'
      end
    end,
  },
}
