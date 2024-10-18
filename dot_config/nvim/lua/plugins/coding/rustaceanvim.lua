return {
	"mrcjkb/rustaceanvim",
	config = function()
		local mason_registry = require("mason-registry")
		local codelldb = mason_registry.get_package("codelldb")
		local extension_path = codelldb:get_install_path() .. "/extentsion"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb"
		if vim.g.is_windows then
			codelldb_path = extension_path .. "adapter\\codelldb.exe"
			liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
		else
			liblldb_path = liblldb_path .. (vim.g.is_linux and ".so" or ".dylib")
		end
		local cfg = require("rustaceanvim.config")
		return {
			dap = {
				adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		}
	end,
}
