return {
	"stevearc/conform.nvim",
	cond = not vim.g.vscode,
	opts = {
		formatters_by_ft = {
			zsh = { "shfmt" },
			bash = { "shfmt" },
			typst = { "typstfmt" },
			tex = { "latexindent" },
			toml = { "taplo" },
			sql = { "sqlfmt" },
		},

		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
		},
	},
}
