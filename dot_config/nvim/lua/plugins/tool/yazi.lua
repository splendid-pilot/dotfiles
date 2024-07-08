return {
  "mikavilpas/yazi.nvim",
  cond = not vim.g.is_windows,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  opts = {
    open_for_directories = false,
  },
}
