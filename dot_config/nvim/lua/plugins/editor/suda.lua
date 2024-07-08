return {
  "lambdalisue/suda.vim",
  lazy = true,
  cond = not vim.g.is_windows,
  cmd = { "SudaRead", "SudaWrite" },
  init = function()
    vim.g["suda#prompt"] = "Enter administrator password: "
  end,
}
