return {
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
  -- Configure LazyVim to load sonokai
  --   {
  --     'LazyVim/LazyVim',
  --     opts = {
  --       colorscheme = 'onedark',
  --     },
  --   },
}
