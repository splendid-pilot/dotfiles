return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.remove(opts.sections.lualine_c)
    table.remove(opts.sections.lualine_c)
  end,
}
