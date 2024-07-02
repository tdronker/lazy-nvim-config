local utils = require('utils')

require('telescope').setup{
    defaults = {
    }
}

utils.map('n', '<C-p>', ':Telescope find_files<CR>')
