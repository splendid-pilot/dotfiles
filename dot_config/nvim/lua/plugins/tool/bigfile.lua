local ftdetect = {
	name = "ftdetect",
	opts = { defer = true },
	disable = function()
		vim.api.nvim_set_option_value("filetype", "big_file_disabled_ft", { scope = "local" })
	end,
}

local cmp = {
	name = "nvim-cmp",
	opts = { defer = true },
	disable = function()
		require("cmp").setup.buffer({ enabled = false })
	end,
}
local treesitter = {
	name = "tree-sitter",
	opts = { defer = true },
	disable = function()
		vim.treesitter.stop(0)
	end,
}
return {
	"LunarVim/bigfile.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	opts = {
		filesize = 1,
		pattern = { "*" },
		features = {
			"lsp",
			"treesitter",
			"syntax",
			"vimopts",
			ftdetect,
			cmp,
			treesitter,
			"indent_blankline",
			"illuminate",
			"matchparen",
			"filetype",
		},
	},
}
