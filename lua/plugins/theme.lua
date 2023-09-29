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
    'sainnhe/sonokai',
  },
  {
    'tokyonight.nvim',
    priority = 1000,
    opts = function()
      return {
        style = 'night',
        transparent = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
        sidebars = {
          'qf',
          'vista_kind',
          'terminal',
          'spectre_panel',
          'startuptime',
          'Outline',
        },
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          local prompt = '#2d3149'
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
  },

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
  { 'projekt0n/github-nvim-theme' },

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
  --   {
  --     'ray-x/starry.nvim',
  --     lazy = true,
  --     setup = function()
  --       -- see example setup below
  --     end,
  --   },
  --   vim.cmd([[
  -- let starry_italic_comments=v:true
  -- let starry_italic_string=v:true
  -- let starry_italic_keywords=v:true
  -- let starry_italic_functions=v:true
  -- let starry_italic_variables=v:true
  -- let starry_contrast=v:false
  -- let starry_borders=v:false
  -- let starry_disable_background=v:true
  -- let starry_style_fix=v:true  "disable random loading
  -- let starry_darker_contrast=v:false
  -- let starry_set_hl=v:false " Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
  -- " not overwrite old values and may has some side effects
  -- let starry_deep_black=v:true
  -- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
  -- ]]),
  {
    'LazyVim/LazyVim',
    opts = function(_, opts)
      if os_is_dark() then
        -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
        opts.colorscheme = 'sonokai'
      else
        opts.colorscheme = 'github_light'
      end
    end,
  },
}
