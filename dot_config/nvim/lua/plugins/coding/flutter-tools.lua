return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  cond = not vim.g.vscode and not vim.g.is_windows,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = true,
}
