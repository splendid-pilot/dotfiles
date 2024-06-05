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
        enabled = false,
        auto_open = {
          enabled = true,
        },
      },
    },
  },
}
