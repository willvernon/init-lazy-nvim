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

-- if vim.fn.has('nvim-0.8') == 1 then
--   vim.opt.backup = true
--   vim.opt.cmdheight = 0
--   vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
-- end
--
--
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.splitkeep = 'screen'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

vim.opt.swapfile = false

vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- disable cursor-styling
-- vim.opt.guicursor = ""

vim.opt.termguicolors = true

vim.opt.cmdheight = 0
