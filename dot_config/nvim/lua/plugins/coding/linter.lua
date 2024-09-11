return {
	"mfussenegger/nvim-lint",
	cond = not vim.g.vscode,
	event = "LazyFile",
}
