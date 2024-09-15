return {
  {
    "nvim-neorg/neorg",
    dependencies = {
      {
        "folke/zen-mode.nvim",
        opts = {},
      },
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
      },
    },
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.ui.calendar"] = {},
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.integrations.nvim-cmp"] = {},
          ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.looking-glass"] = {},
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
          ["core.export"] = {},
          ["core.export.markdown"] = { config = { extensions = "all" } },
          ["core.summary"] = {},
          ["core.tangle"] = { config = { report_on_empty = false } },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
