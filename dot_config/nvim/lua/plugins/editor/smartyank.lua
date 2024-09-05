return {
  "ibhagwan/smartyank.nvim",
  lazy = false,
  cond = vim.g.is_ssh_session,
  config = function()
    require("smartyank").setup()
  end,
}
