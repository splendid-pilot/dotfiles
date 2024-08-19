return {
	"powerman/vim-plugin-AnsiEsc",
	lazy = true,
	cond = not vim.g.vscode,
	cmd = {
		"AnsiEsc",
	},
}
