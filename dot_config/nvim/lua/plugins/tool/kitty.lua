return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	cond = vim.g.is_linux and not vim.g.is_wsl and not vim.g.vscode,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	event = { "User KittyScrollbackLaunch" },
	-- version = '*', -- latest stable version, may have breaking changes if major version changed
	-- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
	opts = {
		paste_window = {
			yank_register_enabled = false,
		},
	},
}
