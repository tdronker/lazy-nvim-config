vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.o.updatetime = 50
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.laststatus = 2
vim.opt.wrap = true
vim.opt.wildmenu = true
vim.opt.syntax = "off"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.errorbells = false
vim.g.syntax_on = false
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.o.clipboard = "unnamedplus"

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.scroll = 10
vim.opt.lazyredraw = true
vim.opt.scrolloff = 10

vim.cmd([[
  filetype plugin indent on
]])

vim.opt.undofile = true
local undodir = vim.fn.stdpath("config") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
