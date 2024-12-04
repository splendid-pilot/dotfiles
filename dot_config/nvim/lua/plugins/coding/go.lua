return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<localleader>e", "<cmd>GoIfErr<cr>", desc = "Go: if err" },
		{ "<localleader>f", "<cmd>GoFillStruct<cr>", desc = "Go: fill struct at cursor" },
		{ "<localleader>c", "<cmd>GoCmt<cr>", desc = "Go: generate cmt" },
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	opts = {
		diagnostic = false,
		sp_inlay_hints = {
			enable = false,
		},
	},
}
