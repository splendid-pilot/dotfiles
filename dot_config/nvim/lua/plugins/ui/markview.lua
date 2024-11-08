return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
  },
  cond = not vim.g.vscode,
  ft = "markdown",
  enabled = false,
  config = function()
    require("markview").setup({
      table = {
        table_chars = {
          "╭",
          "─",
          "╮",
          "┬",
          "├",
          "│",
          "┤",
          "┼",
          "╰",
          "─",
          "╯",
          "┴",
        },
        table_hls = { "rainbow1" },

        use_virt_lines = true,
      },
      code_block = {
        style = "language",
        block_hl = "code_block",

        pad_char = " ",
        language_hl = "Bold",
      },
      inline_code = {
        before = " ",
        after = " ",

        hl = "inline_code_blocks",
      },
    })
  end,
}
