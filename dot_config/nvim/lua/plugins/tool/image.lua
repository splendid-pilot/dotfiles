return {
	"3rd/image.nvim",
	config = true,
	enabled = false,
	cond = not vim.g.vscode and not vim.g.is_wsl and not vim.g.is_windows,
}
