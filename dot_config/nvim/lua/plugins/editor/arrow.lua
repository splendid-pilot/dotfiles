return {
  "otavioschwanck/arrow.nvim",
  lazy = false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = function(_, opts)
    opts.show_icons = true
    opts.leader_key = ";" -- Recommended to be a single key
    opts.buffer_leader_key = "m" -- Per Buffer Mappings
    return opts
  end,
}
