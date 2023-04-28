local utils = require('utils')
local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

utils.map('n', '<leader>ns', ':lua require(\'neogit\').open({ kind = "split" })<cr>')
utils.map('n', '<leader>nc', ':lua require(\'neogit\').open({ "commit", kind = "split" })<cr>')
utils.map('n', '<leader>nh', ':lua require(\'neogit\').open({ "stash", kind = "split" })<cr>')
utils.map('n', '<leader>nb', ':lua require(\'neogit\').open({ "branch", kind = "split" })<cr>')
