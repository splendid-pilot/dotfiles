return {
  "3rd/image.nvim",
  config = true,
  cond = not vim.g.is_wsl and not vim.g.is_windows,
}
