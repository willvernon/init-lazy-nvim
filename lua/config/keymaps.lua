-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local discipline = require('kaizen.discipline')

discipline.cowboy()

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

vim.keymap.set('i', 'jj', '<esc>', { noremap = true })

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)
-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

--Diganostics
keymap.set('n', '<C-j>', function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set('n', '<leader>r', function()
  require('kaizen.utils').replaceHexWithHSL()
end)
