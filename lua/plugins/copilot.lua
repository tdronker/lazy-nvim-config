local utils = require('utils')

require('CopilotChat').setup({
})
utils.map('n', '<C-i>', ':CopilotChat<CR>', { noremap = true, silent = true })

require('copilot').setup({
    suggestion = { enabled = false },
    cmp = {
        enabled = true,
        method = "getCompletionsCycling",
    },
    panel = {
        enabled = false,
    },
})
