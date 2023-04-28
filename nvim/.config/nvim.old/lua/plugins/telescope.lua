local utils = require('utils')
local trouble = require('trouble.providers.telescope')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {'node_modules', 'venv', 'src/*.egg-info'},
    layout_strategy = 'vertical',
    scroll_strategy = 'cycle',
    color_devicons = true,
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
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
utils.map('n', '<Leader>fb', '<cmd>Telescope file_browser<cr>')
