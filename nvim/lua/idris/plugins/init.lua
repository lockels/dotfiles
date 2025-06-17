return {
	-- Smaller plugins

	"nvim-lua/plenary.nvim",

	{ -- Better markdown file rendering
		"OXY2DEV/markview.nvim",
		ft = "markdown",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ -- Better macros
		"chrisgrieser/nvim-recorder",
		dependencies = "rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("recorder").setup({})
		end,
	},

	-- zen-mode and twilight --

	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		config = function()
			require("zen-mode").setup({
				plugins = {
					options = {
						laststatus = 3,
					},
					tmux = { enabled = false },
				},
			})
		end,
	},

	{
		"folke/twilight.nvim",
		event = "VeryLazy",
		config = function()
			require("twilight").setup()
		end,
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				timeout = 3000,
				render = "compact",
				stages = "fade_in_slide_out",
			})
		end,
	},

	-- utils and quality of life --

	{
		"letieu/harpoon-lualine",
		event = "VeryLazy",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"tailwind",
				"css",
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"zsh",
			})
		end,
	},

	-- {
	-- 	"rachartier/tiny-inline-diagnostic.nvim",
	-- 	event = "VeryLazy",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tiny-inline-diagnostic").setup({
	-- 			options = {
	-- 				multilines = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{ -- auto closing html tags
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"typescriptreact",
			"javascriptreact",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {},
			})
		end,
	},

	{ -- tailwind tools
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
		config = function(_, opts)
			require("tailwind-tools").setup(opts)
		end,
	},

	-- Usless plugins

	{
		"Eandrju/cellular-automaton.nvim",
		vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Fuck My Life" }),
	},

	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {},
	-- },
}
