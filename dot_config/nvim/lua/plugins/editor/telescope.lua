return {
  "telescope.nvim",
  dependencies = {
    "olimorris/persisted.nvim",
    "debugloop/telescope-undo.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
  },
  cond = not vim.g.vscode,
  keys = {
    { "<leader>fc", false },
    { "<leader>fr", false },
  },
  opts = function(_, opts)
    require("telescope").load_extension("zoxide")
    require("telescope").load_extension("file_browser")
    -- require("telescope").load_extension("frecency")
    -- require("telescope").load_extension("undo")
    opts.defaults = {
      vimgrep_arguments = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      mappings = {
        n = {
          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
        },
        i = {
          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
    }
    opts.pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
            ["<c-a>"] = require("telescope.actions").select_all,
          },
        },
      },
    }
    opts.extensions = {
      file_browser = {

        hidden = { file_browser = true, folder_browser = true },
        follow_symlinks = true,
        hide_parent_dir = true,
        collapse_dirs = true,
        mappings = {
          ["i"] = {
            ["<bs>"] = false,
          },
          ["n"] = {
            h = require("telescope").extensions.file_browser.actions.goto_parent_dir,
            l = require("telescope.actions").select_default,
          },
        },
      },
      frecency = {
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
        db_safe_mode = false,
      },
      undo = {
        side_by_side = true,
        mappings = { -- this whole table is the default
          i = {
            -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
            -- you want to use the following actions. This means installing as a dependency of
            -- telescope in it's `requirements` and loading this extension from there instead of
            -- having the separate plugin definition as outlined above. See issue #6.
            ["<cr>"] = require("telescope-undo.actions").yank_additions,
            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            ["<C-cr>"] = require("telescope-undo.actions").restore,
          },
        },
      },
    }
    return opts
  end,
}
