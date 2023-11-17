-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.cursorline = false
-- -- Set the color of line numbers to yellow
-- vim.cmd("highlight LineNr guifg=grey ctermfg=grey")
vim.cmd([[highlight LineNr guifg=#FB617E]])
vim.opt.number = true
-- vim.opt.relativenumber = true
-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true
-- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.termguicolors = true

local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.cmdheight = 0
vim.o.showcmdloc = 'statusline'
vim.o.winbar = '%{%v:lua.require\'nvim-navic\'.get_location()%}'
vim.opt.swapfile = false

-- vim.opt.listchars = {
--   space = '.',
--   eol = '↲',
--   nbsp = '␣',
--   trail = '·',
--   precedes = '←',
--   extends = '→',
--   tab = '¬ ',
--   conceal = '※',
-- }
vim.opt.list = true

vim.g.mapleader = ' '

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append({ '**' }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ '*/node_modules/*' })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = 'cursor'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has('nvim-0.8') == 1 then
  vim.opt.cmdheight = 0
end
