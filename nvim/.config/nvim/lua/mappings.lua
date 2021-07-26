local utils = require('utils')

-- kill highlights with escape
utils.map('n', '<esc>', ':nohl<cr>')

-- better window navigation with control
utils.map('n', '<c-h>', ':wincmd h<cr>')
utils.map('n', '<c-j>', ':wincmd j<cr>')
utils.map('n', '<c-k>', ':wincmd k<cr>')
utils.map('n', '<c-l>', ':wincmd l<cr>')

-- better tab navigation with alt
utils.map('n', '<A-h>', ':tabp<cr>')
utils.map('n', '<A-l>', ':tabn<cr>')
utils.map('n', '<A-c>', ':tabclose<cr>')

-- easily open and escape terms
utils.map('n', '<leader><leader>t', ':tabe term://.//zsh<cr>')
utils.map('t', '<esc>', '<c-\\><c-n>')

-- text manipulation with alt
utils.map('n', '<A-j>', ':m .+1<cr>==')
utils.map('n', '<A-k>', ':m .-2<cr>==')
utils.map('i', '<A-j>', '<Esc>:m .+1<cr>==gi')
utils.map('i', '<A-k>', '<Esc>:m .-2<cr>==gi')
utils.map('v', '<A-j>', ':m \'>+1<cr>gv=gv')
utils.map('v', '<A-k>', ':m \'<-2<cr>gv=gv')

-- indent in visual mode
utils.map('v', '>', '>gv')
utils.map('v', '<', '<gv')

-- get around quickfix more easily
utils.map('n', '[q', ':cprevious<cr>')
utils.map('n', ']q', ':cnext<cr>')

-- yank to system
utils.map('n', 'Yy', '"+yy')
utils.map('v', 'Yy', '"+yy')
