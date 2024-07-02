require('nvim-tree').setup({
})

-- Keymap to toggle nvim-tree
local utils = require('utils')
utils.map('n', '<leader>e', ':NvimTreeToggle<CR>')
