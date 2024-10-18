local mapping = require("config.completions")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local MineGroup = augroup("MineGroup", {})

autocmd("LspAttach", {
	group = augroup("LspKeymapLoader", { clear = true }),
	callback = function(event)
		mapping.lsp(event.buf)
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.json" },
	callback = function(event)
		local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
		if filesize < 1024 * 1024 * 0.1 then
			return
		end
		vim.treesitter.stop(event.buf)
		vim.lsp.stop_client(vim.lsp.get_clients())
	end,
})

autocmd("FileType", {
	group = MineGroup,
	command = "set formatoptions-=cro",
})
