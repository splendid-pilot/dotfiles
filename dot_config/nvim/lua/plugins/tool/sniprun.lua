return {
  "michaelb/sniprun",
  lazy = true,
  cond = not vim.g.is_windows,
  build = "bash ./install.sh",
  cmd = { "SnipRun", "SnipReset", "SnipInfo" },
  opts = {
    selected_interpreters = {},
    repl_enable = {},
    repl_disable = {},
    interpreter_options = {},
    display = {
      "TempFloatingWindowOk",
      "NvimNotifyErr",
    },
    display_options = {
      terminal_width = 45,
      notification_timeout = 5000,
    },
    inline_messages = 0,
    borders = "single",
  },
}
