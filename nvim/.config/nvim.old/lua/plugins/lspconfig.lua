local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  require'lsp_signature'.on_attach()
  require'aerial'.on_attach(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "<Leader>cr", "<cmd>Lspsaga rename<cr>", { silent=true })
  vim.keymap.set("n", "<Leader>ca", "<cmd>Lspsaga code_action<cr>", { silent=true })
  vim.keymap.set("x", "<Leader>ca", ":<c-u>Lspsaga range_code_action<cr>", { silent=true })
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent=true })
  local action = require("lspsaga.action")
  vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
  end, { silent=true })
  vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
  end, { silent=true })
  vim.keymap.set("n", "<Leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent=true })
  vim.keymap.set("n", "]e", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent=true })
  vim.keymap.set("n", "[e", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent=true })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
      enable = false,
    }
  }
}

local capabilites = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'
lsp_installer.setup {}

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    on_attach = on_attach,
    capabilites = capabilites
  }
)

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  if server.name == 'sumneko_lua' then
    lspconfig[server.name].setup {
      settings = lua_settings
    }
  end

  lspconfig[server.name].setup {}
end
