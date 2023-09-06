-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  'n',
  '<leader>sx',
  require('telescope.builtin').resume,
  { noremap = true, silent = true, desc = 'Resume' }
)
-- Remap keys for switching windows
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wl', '<C-w>l')
-- Toggle for linebreak
local Util = require('lazyvim.util')
vim.keymap.set('n', '<leader>ub', function()
  Util.toggle('linebreak')
end, { desc = 'Toggle linebreak' })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''
