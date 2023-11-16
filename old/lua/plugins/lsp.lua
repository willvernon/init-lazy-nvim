return {

  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      local nls = require('null-ls')
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gitsigns,
        -- go
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.diagnostics.golangci_lint,
        -- ts
        nls.builtins.formatting.biome,
        require('typescript.extensions.null-ls.code-actions'),
        -- other
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
      })
      return opts
    end,
  },

  {
    'mhanberg/output-panel.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>uo', '<cmd>OutputPanel<cr>', desc = 'Toggle LSP output' },
    },
    config = true,
  },
}
