local utils = require('utils')
local Terminal = require('toggleterm.terminal').Terminal

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<a-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double',
    width = 200,
    height = 60,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}


local lazydocker = Terminal:new({
  cmd = 'lazydocker',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _lazydocker_toggle()
	lazydocker:toggle()
end

function _lazygit_toggle()
	lazygit:toggle()
end

utils.map('n', '<a-d>', '<cmd>lua _lazydocker_toggle()<cr>', { silent = true })
utils.map('n', '<a-g>', '<cmd>lua _lazygit_toggle()<cr>', { silent = true })
