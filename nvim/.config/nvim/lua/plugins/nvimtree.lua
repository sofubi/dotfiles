local utils = require('utils')
local g = vim.g

g.nvim_tree_side = 'left'
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_auto_close = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
g.nvim_tree_update_cwd = 1

utils.map('n', '<C-n>', ':NvimTreeToggle<cr>')
utils.map('n', '<leader>nf', ':NvimTreeFindFile<cr>')
