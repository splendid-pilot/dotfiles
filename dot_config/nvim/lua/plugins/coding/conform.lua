return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      zsh = { "shfmt" },
      bash = { "shfmt" },
      typst = { "typstfmt" },
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },
  },
}
