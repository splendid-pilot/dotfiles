return {
	"stevearc/conform.nvim",
	cond = not vim.g.vscode,
	opts = function(_, opts)
		opts.formatters_by_ft = vim.tbl_deep_extend("keep", opts.formatters_by_ft, {
			zsh = { "shfmt" },
			bash = { "shfmt" },
			typst = { "typstfmt" },
			tex = { "latexindent" },
			toml = { "taplo" },
			sql = { "sqlfluff" },
			cmake = { "cmake_format" },
			["_"] = { "trim_whitespace" },
		})
		-- opts.formatters_by_ft = {
		-- 	zsh = { "shfmt" },
		-- 	bash = { "shfmt" },
		-- 	fish = { "fish_indent" },
		-- 	typst = { "typstfmt" },
		-- 	tex = { "latexindent" },
		-- 	toml = { "taplo" },
		-- 	sql = { "sqlfluff" },
		-- 	cmake = { "cmake_format" },
		-- 	["_"] = { "trim_whitespace" },
		-- }

		opts.formatters = vim.tbl_deep_extend("keep", opts.formatters, {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
			cmake = {
				command = "cmake-format",
				cwd = require("conform.util").root_file({
					"CMakeLists.txt",
					"package.json",
					".git",
					"go.mod",
					".pyproject.toml",
					".envrc",
				}),
			},
			-- sqlfluff = {
			-- 	command = "sqlfluff",
			-- 	args = { "fix", "--dialect", "mysql", "-q" },
			-- 	cwd = require("conform.util").root_file({
			-- 		".editorconfig",
			-- 		"package.json",
			-- 		".git",
			-- 		"go.mod",
			-- 		".pyproject.toml",
			-- 		".envrc",
			-- 		".",
			-- 	}),
			-- },
		})
		return opts
	end,
}
