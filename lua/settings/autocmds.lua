-- Create an autocommand group
vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePost * :FormatWrite
  augroup END
]])
