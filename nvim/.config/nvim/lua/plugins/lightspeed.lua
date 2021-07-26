local utils = require('utils')

require('lightspeed').setup {}

utils.map('n', ';', '<Plug>Lightspeed_s<cr>', { noremap = false })
utils.map('n', ',', '<Plug>Lightspeed_S<cr>', { noremap = false })
