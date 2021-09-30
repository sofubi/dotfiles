local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'lsp_signature'.on_attach()

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
      -- Setup your lua path
      path = vim.split(package.path, ';')
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
     }
    }
  }
}

local flake8 = {
  lintCommand = 'flake8 --stdin-display-name ${INPUT} -',
  lintStdin = true,
  lintFormats = {
    '%f:%l:%c: %m'
  }
}

local black = {
  formatCommand = 'black --quiet -',
  formatStdin = true
}

local mypy = {
  lintCommand = 'mypy --show-column-numbers',
  lintFormats = {
    '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %tote: %m',
  }
}

local eslint = {
  lintCommand = 'eslint_d --stdin --stdin-filename ${INPUT} -f unix',
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {
    '%f(%l,%c): %tarning %m',
    '%f(%l,%c): %rror %m'
  }
}

local prettier = {
  formatCommand = 'prettier_d_slim ${INPUT}',
  formatStdin = true
}

local efm_root_markers = { 'package.json', '.git/', '.venv/' }
local efm_languages = {
  python = { flake8, black, mypy },
  javascript = { eslint, prettier },
  typescript = { eslint, prettier },
  ts = { eslint, prettier }
}

local efm_settings = {
  on_attach = on_attach,
  cmd = {
    "efm-langserver",
    "-c",
    os.getenv('HOME') .. '/.config/efm-langserver/config.yaml',
    "-logfile",
    '/tmp/efm.log'
  },
  init_options = { documentFormatting = true, codeAction = true },
  filetypes = {
    'python',
    'javascript'
  },
  root_dir = nvim_lsp.util.root_pattern(unpack(efm_root_markers)),
  settings = {
    root_markers = efm_root_markers,
    languages = efm_languages
  }
}

local function make_config()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()

local function setup_servers()
  for _, lsp in pairs(servers) do
    local config = make_config()

    if lsp == 'lua' then
      config.settings = lua_settings
    end

    if lsp == 'efm' then
      config = vim.tbl_extend('force', config, efm_settings)
    end

    nvim_lsp[lsp].setup(config)
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function()
  setup_servers()
  vim.cmd('bufdo e')
end
