return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
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
