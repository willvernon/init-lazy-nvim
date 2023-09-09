-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = '%=%m %f'
vim.opt.cursorline = false
-- -- Set the color of line numbers to yellow
-- vim.cmd("highlight LineNr guifg=grey ctermfg=grey")

-- sonokai
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_better_performacne = 1
vim.sonokai_disable_terminal_colors = 1

if vim.fn.has('nvim-0.8') == 1 then
  vim.opt.backup = true
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
end
