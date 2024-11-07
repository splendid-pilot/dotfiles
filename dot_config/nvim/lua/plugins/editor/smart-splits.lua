return {
  "mrjones2014/smart-splits.nvim",
  build = not vim.g.is_windows and not vim.g.is_wsl and "./kitty/install-kittens.bash" or nil,
  lazy = false,
  cond = not vim.g.vscode,
  event = { "CursorHoldI", "CursorHold" },
  opts = {
    ignored_buftypes = {
      "nofile",
      "quickfix",
      "prompt",
    },
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = { "NvimTree" },
    -- the default number of lines/columns to resize by at a time
    default_amount = 3,
  },
}
