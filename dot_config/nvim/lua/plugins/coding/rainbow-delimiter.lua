return {
	"hiphish/rainbow-delimiters.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	config = function()
		local rainbow = require("rainbow-delimiters")
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow.strategy["global"],
				json = function(bufnr)
					local line_count = vim.api.nvim_buf_line_count(bufnr)
					local size = vim.fn.getfsize(vim.fn.expand("%:p"))
					if line_count > 10000 or size > 1024 * 1024 * 0.2 then
						return nil
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
