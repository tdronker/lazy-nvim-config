local utils = require('utils')

utils.map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
utils.map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
utils.map('n', 'X', '<Cmd>bd<CR>', { noremap = true, silent = true })
utils.map('n', 'ä', '<Cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
utils.map('n', 'ö', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
utils.map('n', 'Ä', '<Cmd>bn<CR>', { noremap = true, silent = true })
utils.map('n', 'Ö', '<Cmd>bp<CR>', { noremap = true, silent = true })

utils.map('n', '<C-w>', '<Cmd>vsplit<CR>', { noremap = true, silent = true })
utils.map('n', '<S-L>', '<Cmd>vertical resize +5<CR>', { noremap = true, silent = true })
utils.map('n', '<S-H>', '<Cmd>vertical resize -5<CR>', { noremap = true, silent = true })
