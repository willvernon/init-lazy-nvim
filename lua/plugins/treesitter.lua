vim.treesitter.language.register('markdown', 'mdx')
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    enabled = true,
    opts = { mode = 'cursor' },
  },

  -- {
  --   'nvim-treesitter/playground',
  -- },
}
