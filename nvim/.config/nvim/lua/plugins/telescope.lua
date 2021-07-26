local utils = require('utils')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {'node_modules', 'venv', 'src/*.egg-info'}
  }
}

utils.map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<Leader>gf', '<cmd>Telescope git_files<cr>')
utils.map('n', '<Leader>gs', '<cmd>Telescope grep_string<cr>')
utils.map('n', '<Leader>gr', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<Leader>bu', '<cmd>Telescope buffers<cr>')
utils.map('n', '<Leader>ru', '<cmd>Telescope oldfiles<cr>')
utils.map('n', '<Leader>ta', '<cmd>Telescope tags<cr>')
utils.map('n', '<Leader>bt', '<cmd>Telescope current_buffer_tags<cr>')
utils.map('n', '<Leader>ts', '<cmd>Telescope treesitter<cr>')
utils.map('n', '<Leader>gb', '<cmd>Telescope git_branches<cr>')
