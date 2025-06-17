return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {},
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true,
		})
	end,
}
