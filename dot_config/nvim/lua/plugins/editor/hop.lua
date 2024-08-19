return {
	"smoka7/hop.nvim",
	lazy = true,
	cond = not vim.g.vscode,
	version = "*",
	cmd = { "HopWordMW", "HopLineMW", "HopChar2MW" },
	event = { "CursorHold", "CursorHoldI" },
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
}
