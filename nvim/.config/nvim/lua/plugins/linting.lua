require('lint').linters_by_ft = {
  python = { 'flake8', 'mypy', },
  javascript = { 'eslint', },
  typescript = { 'eslint', },
}

vim.api.nvim_command([[
  autocmd BufWritePost *.py lua require('lint').try_lint()
]])

vim.api.nvim_command([[
  autocmd BufWritePost *.js lua require('lint').try_lint()
]])

vim.api.nvim_command([[
  autocmd BufWritePost *.ts lua require('lint').try_lint()
]])
