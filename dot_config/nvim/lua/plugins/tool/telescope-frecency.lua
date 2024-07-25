return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        frecency = {
          show_scores = true,
          show_unindexed = true,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
          db_safe_mode = false,
        },
      },
    })
    require("telescope").load_extension("frecency")
  end,
}
