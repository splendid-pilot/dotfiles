return {
	"monaqa/dial.nvim",
	opts = function(_, opts)
		local augend = require("dial.augend")
		local lower_boolean = augend.constant.new({
			elements = {
				"true",
				"false",
			},
			word = true,
			cyclic = true,
		})
		table.insert(opts.groups.default, lower_boolean)
	end,
}
