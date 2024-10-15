return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {

			-- "            *     ,MMM8&&&.            *    ",
			-- "                  MMMM88&&&&&    .          ",
			-- "                 MMMM88&&&&&&&              ",
			-- "     *           MMM88&&&&&&&&              ",
			-- "                 MMM88&&&&&&&&    Meowvim :)",
			-- "                 'MMM88&&&&&&'              ",
			-- "                   'MMM8&&&'      *         ",
			-- "          |\\___/|     /\\___/\\               ",
			-- "          )     (     )    ~( .      '      ",
			-- "         =\\     /=   =\\~    /=              ",
			-- "           )===(       ) ~ (                ",
			-- "          /     \\     /     \\               ",
			-- "          |     |     ) ~   (               ",
			-- "         /       \\   /     ~ \\              ",
			-- "         \\       /   \\~     ~/              ",
			-- "  jgs_/\\_/\\__  _/_/\\_/\\__~__/_/\\_/\\_/\\_/\\_/\\_",
			-- "  |  |  |  | ) ) |  |  |//|  |  |  |  |  |  |",
			-- "  |  |  |  |(_(  |  |  (( |  |  |  |  |  |  |",

			"                                        ",
			"                                        ",
			"  _____   _____                         ",
			"  \\    \\  \\    \\                    ",
			"   \\    \\  \\    \\      Neovim :)    ",
			"    \\    \\  \\    \\                  ",
			"     \\    \\  \\    \\  \\-----------| ",
			"      \\    \\  \\    \\  \\          | ",
			"       \\    \\  \\    \\  \\---------| ",
			"       /    /  /     \\                 ",
			"      /    /  /       \\  \\-------|    ",
			"     /    /  /    ^    \\  \\      |    ",
			"    /    /  /    / \\    \\  \\ ----|   ",
			"   /    /  /    /   \\    \\            ",
			"  /____/  /____/     \\____\\           ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("f", "  > Find File", ":Telescope find_files<CR>"),
			dashboard.button("o", "  > Old File", ":Telescope oldfiles<CR>"),
			dashboard.button("w", "󱎸  > Ripgrep", ":Telescope live_grep<CR>"),
			dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
			dashboard.button("c", "  > Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "󰅝  > Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
