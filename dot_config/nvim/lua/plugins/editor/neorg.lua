return {
  "nvim-neorg/neorg",
  lazy = true,
  ft = "norg",
  version = "*",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "varied",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.autocommands"] = {},
      ["core.integrations.treesitter"] = {},
      ["core.neorgcmd"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Projects/notes",
          },
        },
      },
    },
  },
}
