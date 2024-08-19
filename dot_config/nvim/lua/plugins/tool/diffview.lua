return {
	"sindrets/diffview.nvim",
	lazy = true,
	cond = not vim.g.vscode,
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
	opts = {},
}
