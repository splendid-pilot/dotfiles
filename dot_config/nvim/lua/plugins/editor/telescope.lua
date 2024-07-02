return {

  "telescope.nvim",
  dependencies = {
    "olimorris/persisted.nvim",
    "debugloop/telescope-undo.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { "<leader>fc", false },
    { "<leader>fr", false },
  },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
        },
        i = {
          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
            ["<c-a>"] = require("telescope.actions").select_all,
          },
        },
      },
    },
  },
}
