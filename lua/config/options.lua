-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = '%=%m %f'
vim.opt.cursorline = false
-- -- Set the color of line numbers to yellow
-- vim.cmd("highlight LineNr guifg=grey ctermfg=grey")
-- -- Set the color of comments to green
vim.cmd('highlight Keyword guifg=grey ctermfg=grey')
vim.cmd([[highlight Keyword term=bold cterm=bold gui=underline guifg=#FF0000 ctermfg=red]])
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<Tab>', 'copilot-accept', { silent = true, expr = true })
-- vim.keymap.set('i', '<Tab>', '<Plug>(copilot-accept)')
