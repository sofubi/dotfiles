local utils = require('utils')
local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

utils.map('n', '<leader>g', ':Neogit<cr>')
