require("autocmds")
require("keymaps")
require("plugins")

-- Plugins
require("plugin-settings.telescope")
require("plugin-settings.copilot")
require("plugin-settings.lspconfig")
require("plugin-settings.formatter")
require("plugin-settings.treesitter")
require("plugin-settings.saga")
require("plugin-settings.cmp")

-- Options
require("options")

vim.cmd([[
  augroup FormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=o
  augroup END
]])
