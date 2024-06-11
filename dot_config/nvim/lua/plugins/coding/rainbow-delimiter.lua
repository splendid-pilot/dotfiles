return {
  "hiphish/rainbow-delimiters.nvim",
  lazy = false,
  config = function()
    vim.g.rainbow_delimiters = {
      query = {
        [""] = "rainbow-delimiters",
        javascript = "rainbow-delimiters-react",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterOrange",
        "RainbowDelimiterYellow",
        "RainbowDelimiterGreen",
        "RainbowDelimiterBlue",
        "RainbowDelimiterCyan",
        "RainbowDelimiterViolet",
      },
      blacklist = { "tex", "latex" },
    }
  end,
}
