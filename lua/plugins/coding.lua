return {

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    build = 'cd formatter && npm i && npm run build',
    config = {},
  },
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    config = function()
      require('tailwindcss-colors').setup()
    end,
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
  },
  {
    'github/copilot.vim',
    config = function()
      vim.cmd('imap <silent><script><expr> <S-CR> copilot#Accept("\\<CR>")')
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = true
    end,
  },

  -- {
  --   "huggingface/llm.nvim",
  --   opts = {
  --     model = "bigcode/starcoder", -- can be a model ID or an http(s) endpoint
  --     accept_keymap = "<Tab>",
  --     dismiss_keymap = "<S-Tab>",
  --   },
  -- },
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = { 'InsertEnter', 'CmdlineEnter' },
    commit = 'b8c2a62b3bd3827aa059b43be3dd4b5c45037d65',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = function()
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()
      return {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' }),
          ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<Esc>'] = cmp.mapping(function(fallback)
            require('luasnip').unlink_current()
            fallback()
          end),
        }),
        sources = cmp.config.sources({
          { name = 'codeium' },
          { name = 'nvim_lsp', keyword_length = 2 },
          { name = 'luasnip' },
          { name = 'buffer', keyword_length = 3 },
          { name = 'path' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, item)
            local icons = {
              diagnostics = {
                error = '',
                warn = '',
                hint = '',
                info = '',
              },
              git = {
                added = '',
                modified = '',
                removed = '',
                renamed = '➜',
                untracked = '',
                ignored = '',
                unstaged = 'U',
                staged = '',
                conflict = '',
                deleted = '',
              },
              gitsigns = {
                add = '┃',
                change = '┋',
                delete = '',
                topdelhfe = '',
                changedelete = '┃',
                untracked = '┃',
              },
              kinds = {
                Array = '',
                Boolean = '',
                Class = '',
                Color = '',
                Constant = '',
                Constructor = '',
                Copilot = '',
                Enum = '',
                EnumMember = '',
                Event = '',
                Field = '',
                File = '',
                Folder = '',
                Function = '',
                Interface = '',
                Key = '',
                Keyword = '',
                Method = '',
                Module = '',
                Namespace = '',
                Null = '',
                Number = '',
                Object = '',
                Operator = '',
                Package = '',
                Property = '',
                Reference = '',
                Snippet = '',
                String = '',
                Struct = '',
                Text = '',
                TypeParameter = '',
                Unit = '',
                Value = '',
                Variable = '',
                Macro = '', -- Macro
              },
              borders = {
                --- @class BorderIcons
                thin = {
                  top = '▔',
                  right = '▕',
                  bottom = '▁',
                  left = '▏',
                  top_left = '🭽',
                  top_right = '🭾',
                  bottom_right = '🭿',
                  bottom_left = '🭼',
                },
                ---@type BorderIcons
                empty = {
                  top = ' ',
                  right = ' ',
                  bottom = ' ',
                  left = ' ',
                  top_left = ' ',
                  top_right = ' ',
                  bottom_right = ' ',
                  bottom_left = ' ',
                },
                ---@type BorderIcons
                thick = {
                  top = '▄',
                  right = '█',
                  bottom = '▀',
                  left = '█',
                  top_left = '▄',
                  top_right = '▄',
                  bottom_right = '▀',
                  bottom_left = '▀',
                },
              },
              misc = {
                codeium = '󰘦 ',
              },
            }
            item.kind = icons.kinds[item.kind]
            if entry.source.name == 'codeium' then
              item.kind = icons.misc.codeium
              item.kind_hl_group = 'CmpItemKindVariable'
            end
            item.menu = ({
              codeium = 'Codeium',
              nvim_lsp = 'Lsp',
              luasnip = 'Snippet',
              buffer = 'Buffer',
              path = 'Path',
            })[entry.source.name]
            return item
          end,
        },
        experimental = { ghost_text = false },
        sorting = defaults.sorting,
      }
    end,
  },

  -- {
  --   'Exafunction/codeium.vim',
  --   event = 'BufEnter',
  -- },
}
