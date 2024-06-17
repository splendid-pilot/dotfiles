return {
  "hiphish/rainbow-delimiters.nvim",
  lazy = false,
  config = function()
    local rainbow = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow.strategy["global"],
        json = function(bufnr)
          local line_count = vim.api.nvim_buf_line_count(bufnr)
          if line_count > 10000 then
            return nil
          elseif line_count > 10000 then
            return rainbow.strategy["global"]
          end
          return rainbow.strategy["local"]
        end,
      },
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
