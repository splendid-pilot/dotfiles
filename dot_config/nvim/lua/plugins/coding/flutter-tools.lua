return {
  "akinsho/flutter-tools.nvim",
  cond = 1 == vim.fn.executable("flutter"),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = true,
}
