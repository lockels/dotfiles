return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			-- "rcasia/neotest-java", -- java testing
			-- filetypes = { "java" },
		},
		{
			"rouge8/neotest-rust",
			filetypes = { "rust" },
		},
	},
	keys = {
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
		{
			"<leader>td",
			"<cmd>lua require('neotest').run.run({strategy = 'dap'}) <cr>",
			desc = "Debug nearest test",
		},
		{ -- Run tets on current file
			"<leader>tf",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			desc = "Run tests in current file",
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
				require("neotest-rust")({
					args = { "--all-features" },
				}),
			},
		})
	end,
}
