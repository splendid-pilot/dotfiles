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
			sql = { "sqlfluff" },
			["_"] = { "trim_whitespace" },
		},

		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
			sqlfluff = {
				command = "sqlfluff",
				args = { "fix", "--dialect", "mysql", "-q" },
				cwd = require("conform.util").root_file({
					".editorconfig",
					"package.json",
					".git",
					"go.mod",
					".pyproject.toml",
					".envrc",
				}),
				stdin = false,
			},
		},
	},
}
