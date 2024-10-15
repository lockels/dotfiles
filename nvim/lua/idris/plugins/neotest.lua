return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		{
			"rcasia/neotest-java", -- java testing
			filetypes = { "java" },
		},
	},
	keys = {
		{
			"<leader>tf",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			desc = "Run test file",
		},
		{
			"<leader>ts",
			"<cmd>lua require('neotest').summary.toggle()<cr>",
			desc = "Test summary window",
		},
	},

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-java"),
			},
		})
	end,
}
