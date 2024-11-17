return {
	"mfussenegger/nvim-lint",
	cond = not vim.g.vscode,
	event = "LazyFile",
	opts = function(_, opts)
		opts.linters_by_ft = {
			go = { "golangcilint", "revive" },
			gomod = { "golangcilint", "revive" },
		}
	end,
}
