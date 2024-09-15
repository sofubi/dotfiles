return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        basedpyright = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "normal",
            },
          },
        },
        ruff = {},
        bashls = {},
        jsonls = {},
        lua_ls = {},
        marksman = {},
        taplo = {},
        ts_ls = {},
        vtsls = {},
        yamlls = {},
      },
    },
  },
}
