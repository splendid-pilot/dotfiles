return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      zsh = { "shfmt" },
      bash = { "shfmt" },
      typst = { "typstfmt" },
      tex = { "latexindent" },
      taplo = { "taplo" },
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },
  },
}
