-- Performance
vim.opt.updatetime = 50
vim.opt.lazyredraw = true
vim.opt.scroll = 20
vim.opt.scrolloff = 20

-- Design
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 2
vim.opt.wrap = true
vim.opt.wildmenu = true
vim.opt.syntax = "off"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.display:append("lastline")
vim.opt.colorcolumn = "100"
vim.o.textwidth = 100
vim.opt.formatoptions:append("t")

vim.o.clipboard = "unnamedplus"

-- File Handling
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
local undodir = vim.fn.stdpath("config") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- Plugins
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Other Settings
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.errorbells = false

-- Enable Filetype plugins and indent
vim.cmd([[
    filetype plugin indent on
]])
