return {
  "mikesmithgh/kitty-scrollback.nvim",
  cond = 1 == vim.fn.executable("kitty") and not vim.g.vscode,
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  event = { "User KittyScrollbackLaunch" },
  -- version = '*', -- latest stable version, may have breaking changes if major version changed
  -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
  opts = {
    paste_window = {
      yank_register_enabled = false,
    },
  },
}
