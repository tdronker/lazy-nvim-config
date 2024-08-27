vim.api.nvim_exec(
	[[
  autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx EslintFixAll
]],
	false
)

-- Create an autocommand group
vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePost * :FormatWrite
  augroup END
]])
