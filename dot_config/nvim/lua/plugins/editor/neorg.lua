return {
	"nvim-neorg/neorg",
	lazy = true,
	enabled = false,
	cond = not vim.g.vscode,
	ft = "norg",
	version = "*",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-neorg/neorg-telescope" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	opts = function(_, opts)
		opts.load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icon_preset = "varied",
					icons = {
						code_block = {
							content_only = true,
							conceal = true,
							width = "content",
							nodes = { "ranged_verbatim_tag" },
						},
					},
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.journal"] = {},
			["core.autocommands"] = {},
			["core.integrations.treesitter"] = {},
			["core.integrations.nvim-cmp"] = {},
			["core.integrations.telescope"] = {},
			["core.qol.todo_items"] = {},
			["core.qol.toc"] = {},
			["core.looking-glass"] = {},
			["core.keybinds"] = {},
			["core.pivot"] = {},
			["core.neorgcmd"] = {},
			["core.summary"] = {},
			["core.esupports.hop"] = {},
			["core.esupports.indent"] = {},
			["core.esupports.metagen"] = {},
			["core.presenter"] = {
				config = {
					zen_mode = "zen-mode",
				},
			},
			["core.promo"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Projects/notes",
						index = "index.norg",
					},
				},
			},
		}
		if not vim.g.is_windows and not vim.g.is_wsl then
			opts.load["core.integrations.image"] = {}
			opts.load["core.latex.renderer"] = {}
		end
	end,
}
