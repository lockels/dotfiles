return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		views = {
			cmdline_popup = {
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 55,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 11,
					col = "50%",
				},
				size = {
					width = 55,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		lsp = {
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
				silent = true,
			},
			progress = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		cmdline = {
			format = {
				help = { pattern = { "^:%s*he?l?p?%s+", "FloatingHelp " } },
				search_down = {
					icon = "󰍉",
				},
				search_up = {
					icon = "󰍉",
				},
			},
		},
	},
}
