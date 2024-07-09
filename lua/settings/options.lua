-- General settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 2           -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2        -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.wrap = false          -- Disable line wrap
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.colorcolumn = '120'   -- Highlight column 120
vim.wo.signcolumn = "yes"
vim.o.scrolloff = 10

-- Additional recommended settings
vim.opt.autoindent = true         -- Copy indent from current line when starting a new line
vim.opt.smartindent = true        -- Smart autoindenting when starting a new line
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- Override ignorecase if search pattern contains uppercase letters
vim.opt.hlsearch = true           -- Highlight search results
vim.opt.incsearch = true          -- Show search results as you type
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.splitright = true         -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true         -- Horizontal splits will automatically be below

-- Performance optimizations
vim.opt.lazyredraw = true -- Do not redraw while executing macros
vim.opt.updatetime = 300  -- Faster completion
vim.opt.timeoutlen = 150  -- By default timeoutlen is 1000 ms

-- Backup and undo settings
vim.opt.backup = false                                 -- Don't create backup files
vim.opt.writebackup = false                            -- Don't create backup files before writing
vim.opt.swapfile = false                               -- Don't use swapfile
vim.opt.undofile = true                                -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo' -- Set undo directory

-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
