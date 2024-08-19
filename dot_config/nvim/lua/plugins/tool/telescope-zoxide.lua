return {
	"jvgrootveld/telescope-zoxide",
	cond = not vim.g.vscode,
	config = function()
		require("telescope").load_extension("zoxide")
	end,
}
