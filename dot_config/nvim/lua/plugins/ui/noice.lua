return {
  "folke/noice.nvim",
  opts = {
    -- cmdline = {
    --   view = "cmdline",
    -- },
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
    },
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
  },
}
