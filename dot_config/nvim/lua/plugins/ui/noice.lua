return {
  "folke/noice.nvim",
  opts = {
    messages = {
      view = "mini",
    },
    routes = {
      {
        view = "mini",
        filter = {
          find = "E486",
        },
      },
      {
        filter = {
          find = "^/.",
        },
        opts = { skip = true },
      },
      {
        filter = {
          find = "Finding",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "^{%s*%d+%s*",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
    },
    lsp = {
      signature = {
        enabled = false,
        auto_open = {
          enabled = false,
        },
      },
    },
  },
}
