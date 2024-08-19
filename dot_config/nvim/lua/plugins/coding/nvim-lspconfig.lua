return {
	"neovim/nvim-lspconfig",
	opts = {
		diagnostics = {
			virtual_text = false,
		},
		setup = {
			rust_analyzer = function()
				return true
			end,
		},
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "LazyVim", "require" },
						},
					},
				},
			},
		},
	},
}
