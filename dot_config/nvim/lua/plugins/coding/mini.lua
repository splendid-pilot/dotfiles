return {
  { "echasnovski/mini.comment", cond = vim.g.vscode },
  { "echasnovski/mini.pairs", cond = vim.g.vscode },
  {
    "echasnovski/mini.align",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup()
    end,
  },
}
