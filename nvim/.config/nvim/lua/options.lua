-- Pull in utils and set some variables
local utils = require('utils')

local g = vim.g
local cmd = vim.cmd
local indent = 2

-- Set python and node providers
g['python3_host_prog'] = os.getenv("HOME")..'/.virtualenvs/nvim3/bin/python'
g['python_host_prog'] = os.getenv("HOME")..'/.pyenv/versions/nvim2/bin/python'

-- colors
g.background='dark'
cmd[[colorscheme catppuccin]]

-- Set some options
cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'tabstop', indent)
utils.opt('w', 'colorcolumn', '120')
utils.opt('o', 'clipboard', 'unnamedplus')
utils.opt('o', 'backup', false)
utils.opt('o', 'writebackup', false)
utils.opt('o', 'cmdheight', 2)
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'inccommand', 'split')
utils.opt('o', 'mps', '(:),[:],{:},<:>')
utils.opt('o', 'number', true)
utils.opt('o', 'relativenumber', true)
utils.opt('o', 'showcmd', false)
utils.opt('o', 'preserveindent', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'timeoutlen', 6000)
utils.opt('o', 'undodir', os.getenv('HOME') .. '/.vim/undo-dir')
utils.opt('o', 'undofile', true)
utils.opt('o', 'undolevels', 5000)
utils.opt('o', 'updatetime', 50)
utils.opt('o', 'signcolumn', 'yes')
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'encoding', 'UTF-8')
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'autoindent', true)
utils.opt('o', 'wrap', false)
utils.opt('o', 'pumblend', 30)
utils.opt('o', 'smartcase', true)
vim.opt.formatoptions = vim.opt.formatoptions
  - "a"
  - "t"
  + "c"
  + "q"
  - "o"
  + "r"
  + "n"
  + "j"
  - "2"

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
