return {
	"folke/zen-mode.nvim",
	lazy = true,
	cond = not vim.g.vscode,
	cmd = {
		"ZenMode",
	},
	opts = {
		window = {
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
	},
}
