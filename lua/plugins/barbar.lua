local utils = require('utils')

utils.map('n', '<C-m>', ':BufferPick<CR>', { noremap = true, silent = true })
utils.map('n', 'Ä', ':BufferNext<CR>', { noremap = true, silent = true })
utils.map('n', 'Ö', ':BufferPrev<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>xx', ':BufferCloseAllButVisible<CR>', { noremap = true, silent = true })
