return {
  "max397574/better-escape.nvim",
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  opts = {
    mapping = { "jk", "jj" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
  },
}
