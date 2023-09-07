return {
  --
  -- sonokai
  --
  {
    'sainnhe/sonokai',
  },

  --
  -- vscode
  --
  {
    'Mofiqul/vscode.nvim',
    opts = {
      style = 'light',
    },
  },
  --
  --  oxocarbon
  --
  {
    'nyoom-engineering/oxocarbon.nvim',
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },

  --
  -- onedark
  --
  {
    'navarasu/onedark.nvim',
    opts = {
      -- Main options --
      style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = {
        'dark',
        'darker',
        'cool',
        'deep',
        'warm',
        'warmer',
        'light',
      }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = 'italic',
        keywords = 'italic',
        functions = 'italic',
        strings = 'none',
        variables = 'italic',
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {
        bright_orange = '#ff8800', -- define a new color
        salmon = '#B55040', -- redefine an existing color
        var_red = '#EA4447',
        selectors = '#F57474',
        classes = '#BC72BB',
        properties = '#272727',
      },
      highlights = {
        -- ['@variables'] = { fg = '$red' },
        -- ['@string'] = { fg = '$bright_orange', fmt = 'bold' },
        -- ['@field'] = { fg = '$red' },
        -- ['@keyword'] = { fg = '$red' },
        -- TSKeyword = { fg = '$salmon' },
        -- TSString = { fg = '$bright_orange', bg = '#00ff00', fmt = 'bold' },
        -- TSFunction = { fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic' },
        -- TSFuncBuiltin = { fg = '#0059ff' },
        -- ['@function'] = {
        --   fg = '#0000ff',
        --   sp = '$cyan',
        --   fmt = 'underline,italic',
        -- },
        --['@function.builtin'] = { fg = '#0059ff' },
      },

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
  --
  -- tokyonight
  --
  {
    'tokyonight.nvim',
    --	priority = 1000,
    opts = function()
      return {
        style = 'moon',
        transparent = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
          variables = { italic = true },
        },
        sidebars = {
          'qf',
          'vista_kind',
          'terminal',
          'spectre_panel',
          'startuptime',
          'Outline',
        },
        on_colors = function(c) end,
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.grey }
          hl.LineNrBelow = { fg = c.grey }
          -- local prompt = "#2d3149"
          -- hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          -- hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          -- hl.TelescopePromptNormal = { bg = prompt }
          -- hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          -- hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          -- hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          -- hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
  },

  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'sonokai', -- 'onedark' -- "vscode", -- "tokyonight-night",
    },
  },
}
