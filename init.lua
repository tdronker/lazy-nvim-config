-- Function to ensure lazy.nvim is installed
local ensure_lazy_installed = function()
    local lazy_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/lazy.nvim'
    if not vim.loop.fs_stat(lazy_path) then
        vim.fn.system({
            'git',
            'clone',
            '--depth', '1',
            'https://github.com/folke/lazy.nvim',
            lazy_path
        })
        vim.cmd([[packadd lazy.nvim]])
    end
end

-- Ensure lazy.nvim is installed
ensure_lazy_installed()

-- Load settings
require('settings.options')
require('settings.keymaps')
require('settings.autocmds')

-- Load plugins
require('plugins')
