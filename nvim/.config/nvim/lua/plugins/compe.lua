local utils = require('utils')

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
    snippets_nvim = true;
  };
}

utils.map('i', '<c-space>', 'compe#complete()', {silent = true, expr = true})
utils.map('i', '<CR>', 'compe#confirm(\'<CR>\')', {silent = true, expr = true})
utils.map('i', '<c-e>', 'compe#close(\'<c-e>\')', {silent = true, expr = true})
utils.map('i', '<c-f>', 'compe#scroll({ \'delta\': +4})', {silent = true, expr = true})
utils.map('i', '<c-d>', 'compe#scroll({ \'delta\': -4})', {silent = true, expr = true})
