return {
  "mikavilpas/yazi.nvim",
  cond = not vim.g.is_windows and not vim.g.vscode,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  opts = {
    open_for_directories = false,
  },
}
