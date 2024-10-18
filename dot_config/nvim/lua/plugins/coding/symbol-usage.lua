local SymbolKind = vim.lsp.protocol.SymbolKind
return {
	"Wansmer/symbol-usage.nvim",
	event = "BufReadPre",
	cond = not vim.g.vscode,
	config = function()
		require("symbol-usage").setup({

			hl = { link = "Comment" },
			kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Class },

			kinds_filter = {},

			vt_position = "above",
			vt_priority = nil,

			request_pending_text = "loading...",

			references = { enabled = true, include_declaration = false },
			definition = { enabled = false },
			implementation = { enabled = false },

			disable = { lsp = {}, filetypes = {}, cond = {} },

			symbol_request_pos = "end",
		})
	end,
}
