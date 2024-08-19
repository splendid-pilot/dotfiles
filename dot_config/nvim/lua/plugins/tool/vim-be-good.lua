return {
	"theprimeagen/vim-be-good",
	lazy = true,
	cond = not vim.g.vscode,
	cmd = { "VimBeGood" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function() end,
}
