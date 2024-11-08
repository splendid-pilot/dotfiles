return {
  "ellisonleao/glow.nvim",
  cond = 1 == vim.fn.executable("glow") and not vim.g.vscode,
  config = true,
  cmd = { "Glow" },
}
