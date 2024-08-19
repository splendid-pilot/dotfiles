return {
	"mfussenegger/nvim-lint",
	cond = not vim.g.vscode,
	event = "LazyFile",
	opts = {
		-- Event to trigger linters
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			fish = { "fish" },
		},
		---@type table<string,table>
		linters = {},
	},
}
