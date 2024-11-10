return {
	"telescope.nvim",
	dependencies = {
		"olimorris/persisted.nvim",
		"debugloop/telescope-undo.nvim",
		"jvgrootveld/telescope-zoxide",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-file-browser.nvim",
			config = function()
				local fb_actions = require("telescope").extensions.file_browser.actions
				require("telescope._extensions.file_browser").setup({
					hidden = { file_browser = true, folder_browser = true },
					hide_parent_dir = true,
					collapse_dirs = true,
					quiet = true,
					mappings = {
						["n"] = {
							a = fb_actions.create,
							h = fb_actions.goto_parent_dir,
						},
						["i"] = {
							["<C-,>"] = fb_actions.sort_by_size,
							["<C-.>"] = fb_actions.sort_by_date,
						},
					},
				})
			end,
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			opts = {
				db_safe_mode = false,
				enable_prompt_mappings = true,
				show_scores = false,
				auto_validate = true,
				hide_current_buffer = true,
				matcher = "fuzzy",
			},
		},
	},
	keys = {
		{ "<leader>fr", false },
		{ "<leader>fc", false },
	},
	cond = not vim.g.vscode,
}
