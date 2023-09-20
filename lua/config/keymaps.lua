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
-- Needed for markdown
-- vim.opt.wrap = true
-- vim.opt.linebreak = true
-- Toggle for linebreak
local Util = require('lazyvim.util')
vim.keymap.set('n', '<leader>ub', function()
  Util.toggle('linebreak')
end, { desc = 'Toggle linebreak' })
-- LSP Suggestion Prompt Accept with Tab
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "<CR>" : "<Tab>"', { expr = true })
-- vim.keymap.set('i', '<Tab>', '<CR>', { expr = true })
--
-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>du', [["_d]])
-- UndoTree
vim.keymap.set('n', '<leader>cu', vim.cmd.UndotreeToggle)

-- overwrite lazyvim mappings with vim-tmux-navigator mappings
-- see: https://github.com/christoomey/vim-tmux-navigator/blob/master/plugin/tmux_navigator.vim
-- https://github.com/LazyVim/LazyVim/discussions/322#discussioncomment-5548050
vim.keymap.set('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-\\>', ':<C-U>TmuxNavigatePrevious<cr>', { noremap = true, silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<Cmd-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

vim.keymap.set('i', 'xx', '<esc>', { noremap = true })
