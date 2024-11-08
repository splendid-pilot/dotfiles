return {
  "NvChad/nvim-colorizer.lua",
  lazy = false,
  config = function()
    require("colorizer").setup({ user_default_options = { names = true, css = true, css_fn = true } })
  end,
  cond = not vim.g.vscode,
}
