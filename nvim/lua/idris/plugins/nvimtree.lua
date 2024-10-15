return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			adaptive_size = false,
			side = "left",
			width = 30,
			preserve_window_proportions = true,
		},
		git = {
			enable = true,
			ignore = true,
		},
		diagnostics = {
			enable = true,
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
			},
			file_popup = {
				open_win_config = {
					col = 1,
					row = 1,
					relative = "cursor",
					border = "rounded",
					style = "minimal",
				},
			},
		},
		renderer = {
			root_folder_label = false,
			highlight_git = false,
			highlight_opened_files = "none",
			indent_markers = {
				enable = false,
			},
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = "󰈚",
					symlink = "",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		local keymap = vim.keymap
		keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
