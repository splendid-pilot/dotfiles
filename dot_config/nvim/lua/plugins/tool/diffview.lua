return {
  "sindrets/diffview.nvim",
  cond = not vim.g.vscode,
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
}
