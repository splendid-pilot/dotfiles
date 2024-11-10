return {
	"nvimdev/dashboard-nvim",

	opts = function(_, opts)
		local logo = [[
████████╗██╗  ██╗███████╗ ██████╗ ██████╗  ██████╗ ██████╗ ███████╗
╚══██╔══╝██║  ██║██╔════╝██╔═══██╗██╔══██╗██╔═══██╗██╔══██╗██╔════╝
   ██║   ███████║█████╗  ██║   ██║██║  ██║██║   ██║██████╔╝█████╗  
   ██║   ██╔══██║██╔══╝  ██║   ██║██║  ██║██║   ██║██╔══██╗██╔══╝  
   ██║   ██║  ██║███████╗╚██████╔╝██████╔╝╚██████╔╝██║  ██║███████╗
   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
]]
		logo = string.rep("\n", 8) .. logo .. "\n\n"
		for _, val in ipairs(opts.config.center) do
			if string.find(val.desc, "Recent") then
				val.action = "Telescope frecency"
			end
		end
		opts.config.header = vim.split(logo, "\n")
		return opts
	end,
}
