return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "ruff",
        "black",
        "mypy",
        "pyright",
      },
    },
  },
}
