-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.cursorline = false
-- -- Set the color of line numbers to yellow
-- vim.cmd("highlight LineNr guifg=grey ctermfg=grey")

-- sonokai
-- vim.g.sonokai_style = 'andromeda'
-- vim.g.sonokai_enable_italic = 1
-- vim.g.sonokai_better_performacne = 1
-- vim.g.sonokai_disable_terminal_colors = 1
-- vim.g.sonokai_transparent_background = 1

-- if vim.fn.has('nvim-0.8') == 1 then
--   vim.opt.backup = true
--   vim.opt.cmdheight = 0
--   vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
-- end
--
--
vim.cmd([[highlight LineNr guifg=#FB617E]])
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.splitkeep = 'screen'

vim.opt.ignorecase = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

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

local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.cmdheight = 0
vim.o.showcmdloc = 'statusline'
vim.o.winbar = '%{%v:lua.require\'nvim-navic\'.get_location()%}'
vim.opt.swapfile = false

vim.opt.listchars = {
  space = '.',
  eol = '↲',
  nbsp = '␣',
  trail = '·',
  precedes = '←',
  extends = '→',
  tab = '¬ ',
  conceal = '※',
}
vim.opt.list = true
