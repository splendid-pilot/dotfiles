return {
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
}
