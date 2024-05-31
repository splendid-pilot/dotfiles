return {
  "telescope.nvim",
  dependencies = {
    {
      "olimorris/persisted.nvim",
      lazy = true,
      cmd = {
        "SessionToggle",
        "SessionStart",
        "SessionStop",
        "SessionSave",
        "SessionLoad",
        "SessionLoadLast",
        "SessionLoadFromFile",
        "SessionDelete",
      },
      config = function()
        require("persisted").setup({
          save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
          silent = false, -- silent nvim message when sourcing session file
          use_git_branch = true, -- create session files based on the branch of the git enabled repository
          autosave = true, -- automatically save session files when exiting Neovim
          should_autosave = function()
            if vim.bo.filetype == "alpha" then
              return false
            end
            return true
          end, -- function to determine if a session should be autosaved
          -- Set `lazy = false` in `plugins/editor.lua` to enable this
          autoload = false, -- automatically load the session for the cwd on Neovim startup
          on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
          follow_cwd = true, -- change session file name to match current working directory if it changes
          allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
          ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
          telescope = { -- options for the telescope extension
            reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
          },
        })
        require("telescope").load_extension("persisted")
      end,
    },
    {
      "debugloop/telescope-undo.nvim",
      config = function()
        require("telescope").setup({
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
        })
        require("telescope").load_extension("undo")
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "jvgrootveld/telescope-zoxide",
      config = function()
        require("telescope").load_extension("zoxide")
      end,
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require("telescope").setup({
          extensions = {
            frecency = {
              show_scores = true,
              show_unindexed = true,
              ignore_patterns = { "*.git/*", "*/tmp/*" },
            },
          },
        })
        require("telescope").load_extension("frecency")
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
        require("telescope").setup({
          extensions = {
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
                  h = fb_actions.goto_parent_dir,
                  l = require("telescope.actions").select_default,
                },
              },
            },
          },
        })
        require("telescope").load_extension("file_browser")
      end,
    },
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
