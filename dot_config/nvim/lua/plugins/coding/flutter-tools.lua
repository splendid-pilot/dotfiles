return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = true,
}
