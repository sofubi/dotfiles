local utils = require('utils')

-- kill highlights with escape
utils.map('n', '<esc>', ':nohl<cr>')

-- better window navigation with control
utils.map('n', '<c-h>', '<Plug>WinMoveLeft', { noremap = false })
utils.map('n', '<c-j>', '<Plug>WinMoveDown', { noremap = false })
utils.map('n', '<c-k>', '<Plug>WinMoveUp', { noremap = false })
utils.map('n', '<c-l>', '<Plug>WinMoveRight', { noremap = false })

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

-- faster resize
utils.map('n', '<leader>+', ':exe "resize " . (winheight(0) * 1/2)<cr>')
utils.map('n', '<leader>-', ':exe "resize " . (winheight(0) * 2/3)<cr>')
utils.map('n', '<leader>h+', ':exe "resize " . (winwidth(0) * 3/2)<cr>')
utils.map('n', '<leader>h-', ':exe "resize " . (winwidth(0) * 2/3)<cr>')

-- even faster resize
utils.map('n', '<leader>z', '<Plug>Zoom', { noremap = false })
