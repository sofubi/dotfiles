local utils = require('utils')
require('spectre').setup()

utils.map('n', '<A-s>', ':lua require(\'spectre\').open()<cr>')
utils.map('n', '<leader>sf', 'viw:lua require(\'spectre\').open_file_search()<cr>')
utils.map('n', '<leader>sw', ':lua require(\'spectre\').open_visual({select_word=true})<cr>')
utils.map('v', '<leader>s', ':lua require(\'spectre\').open_visual()<cr>')
