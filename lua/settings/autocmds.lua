vim.api.nvim_exec([[
  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx EslintFixAll
]], false)
