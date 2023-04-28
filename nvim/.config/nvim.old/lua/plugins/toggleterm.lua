local utils = require('utils')
local Terminal = require('toggleterm.terminal').Terminal

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<a-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double',
    winblend = 3,
  }
}


local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazydocker_toggle()
	lazydocker:toggle()
end

function _lazygit_toggle()
	lazygit:toggle()
end

utils.map('n', '<a-d>', '<cmd>lua _lazydocker_toggle()<cr>', { silent = true })
utils.map('n', '<a-g>', '<cmd>lua _lazygit_toggle()<cr>', { silent = true })
