local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('lua')
    :fmt('lsp')
    :lint('selene')

ft('python')
    :lint('flake8')
    :fmt('black')

-- Call setup() LAST!
require('guard').setup({
  -- Choose to format on every write to a buffer
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
  save_on_fmt = true,
})
