local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'lsp_signature'.on_attach()
  require'aerial'.on_attach(client, bufnr)

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap("n", "<Leader>cr", "<cmd>Lspsaga rename<cr>", opts)
  buf_set_keymap("n", "<Leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  buf_set_keymap("x", "<Leader>ca", ":<c-u>Lspsaga range_code_action<cr>", opts)
  buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  buf_set_keymap("n", "<Leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  buf_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  buf_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  buf_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
  buf_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
      vim.cmd [[
        hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
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

local lsp_installer = require 'nvim-lsp-installer'
local servers = {
  "bashls",
  "clangd",
  "dockerls",
  "jsonls",
  "tsserver",
  "sumneko_lua",
  "remark_ls",
  "pyright",
  "sqlls",
  "taplo",
  "terraformls",
  "yamlls",
  "rust_analyzer",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    local opts = make_config()

    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end

    if name == 'sumneko_lua' then
      opts.settings = lua_settings
    end

    if server:is_installed() then
      server:setup(opts)
    end
  end
end
