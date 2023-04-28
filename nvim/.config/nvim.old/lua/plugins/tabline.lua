vim.g.bufferline = {
  auto_hide = true,
}

local map = require('utils').map

-- Nav
map('n', '<A-h>', ':BufferPrevious<cr>', { silent = true })
map('n', '<A-l>', ':BufferNext<cr>', { silent = true })

-- Close
map('n', '<A-x>', ':BufferClose<cr>', { silent = true })

-- BufferPick
map('n', '<A-.>', ':BufferPick<cr>', { silent = true })
