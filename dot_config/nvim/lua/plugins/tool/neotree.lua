return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      lazy = true,
      event = "VeryLazy",
      version = "2.*",
      config = function()
        require("window-picker").setup()
      end,
    },
  },
  enabled = false,
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_hidden = false,
        never_show = {
          ".git",
          ".github",
        },
      },
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = {},
    },
  },
}
