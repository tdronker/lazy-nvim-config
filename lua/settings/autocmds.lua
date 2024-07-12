vim.api.nvim_exec([[
  autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx EslintFixAll
]], false)
