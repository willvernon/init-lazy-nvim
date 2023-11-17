local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  spec = {
    -- {
    --   'LazyVim/LazyVim',
    --   import = 'lazyvim.plugins',
    --   opts = {
    --     colorscheme = 'solarized-osaka',
    --     news = {
    --       lazyvim = true,
    --       neovim = true,
    --     },
    --   },
    -- },
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- import any extras modules here
    { import = 'lazyvim.plugins.extras.formatting.prettier' },
    { import = 'lazyvim.plugins.extras.lang.typescript' },
    { import = 'lazyvim.plugins.extras.linting.eslint' },
    --  { import = 'lazyvim.plugins.extras.coding.copilot' },
    { import = 'lazyvim.plugins.extras.lang.json' },
    { import = 'lazyvim.plugins.extras.lang.rust' },
    { import = 'lazyvim.plugins.extras.lang.tailwind' },
    { import = 'lazyvim.plugins.extras.ui.mini-animate' },
    -- { import = 'lazyvim.plugins.extras.ui.edgy' },
    -- { import = 'lazyvim.plugins.extras.dap.core' },
    { import = 'lazyvim.plugins.extras.vscode' },
    -- { import = 'lazyvim.plugins.extras.dap.nlua' },
    { import = 'lazyvim.plugins.extras.util.mini-hipatterns' },
    { import = 'lazyvim.plugins.extras.test.core' },
    { import = 'lazyvim.plugins.extras.coding.yanky' },
    { import = 'lazyvim.plugins.extras.editor.mini-files' },
    -- import/override with your plugins
    { import = 'plugins' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'monokai-pro', 'sonokai', 'tokyonight', 'habamax' } },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = 'none',
    title = nil, ---@type string only works when border is not "none"
    title_pos = 'center', ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = ' ',
      config = '',
      event = '',
      ft = ' ',
      init = ' ',
      import = ' ',
      keys = ' ',
      lazy = '󰒲 ',
      loaded = '●',
      not_loaded = '○',
      plugin = ' ',
      runtime = ' ',
      source = ' ',
      start = '',
      task = '✔ ',
      list = {
        '●',
        '➜',
        '★',
        '‒',
      },
    },
    custom_keys = {
      -- ['<Tab>'] = false,
    },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          'gzip',
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          'tarPlugin',
          'tohtml',
          'tutor',
          'zipPlugin',
        },
      },
    },
  },
})
