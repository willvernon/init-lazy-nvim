return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      panel = {
        keymap = {
          jump_next = '<c-j>',
          jump_prev = '<c-k>',
          accept = '<Tab>',
          refresh = 'r',
          open = '<M-CR>',
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<Tab>',
          next = '<c-j>',
          prev = '<c-k>',
          dismiss = '<CR>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    event = 'VeryLazy',
    config = function()
      require('copilot_cmp').setup()
    end,
  },

  {
    'nvim-cmp',
    opts = function(_, opts)
      local cmp = require('cmp')
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = 'copilot' },
      }))
    end,
  },
}
