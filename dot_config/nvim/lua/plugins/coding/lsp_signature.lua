return {
	"ray-x/lsp_signature.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
