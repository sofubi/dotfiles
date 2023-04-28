require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = {
    'phpdoc'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {
      'python'
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}
