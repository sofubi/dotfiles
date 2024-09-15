return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "basedpyright",
      "bash-language-server",
      "eslint-lsp",
      "json-lsp",
      "lua-language-server",
      "marksman",
      "ruff",
      "shellcheck",
      "shfmt",
      "stylua",
      "taplo",
      "vtsls",
      "yaml-language-server",
    })
  end,
}
