local saga = require 'lspsaga'
local utils = require('utils')

saga.init_lsp_saga()

-- Hover doc
utils.map('n', 'K', ':Lspsaga hover_doc<cr>', { silent = true })
utils.map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")

-- Code action
utils.map('n', '<leader>ca', ':Lspsaga code_action<cr>')
utils.map('v', '<leader>ca', ':Lspsaga range_code_action<cr>')

-- Diagnostics
utils.map('n', '<leader>ld', ':Lspsaga show_line_diagnostics<cr>', { silent = true })
utils.map('n', '<leader>cd', ':Lspsaga show_cursor_diagnostics<cr>', { silent = true })
utils.map('n', '[e', ':Lspsaga diagnostic_jump_next<cr>', { silent = true })
utils.map('n', ']e', ':Lspsaga diagnostic_jump_prev<cr>', { silent = true })
