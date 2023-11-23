vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.html,*.json,*.md,*.lua,*.rs,*.py FormatWrite
  augroup END
]],
	true
)
