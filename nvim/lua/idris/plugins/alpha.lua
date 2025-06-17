return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "RileyGabrielson/inspire.nvim" },

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local inspire = require("inspire")

		-- Set header
		local header = {
			"                                                            ",
			"           _____   _____                                    ",
			"           \\    \\  \\    \\                               ",
			"            \\    \\  \\    \\      Neovim :)               ",
			"             \\    \\  \\    \\                             ",
			"              \\    \\  \\    \\  \\-----------|            ",
			"               \\    \\  \\    \\  \\          |            ",
			"                \\    \\  \\    \\  \\---------|            ",
			"                /    /  /     \\                            ",
			"               /    /  /       \\  \\-------|               ",
			"              /    /  /    ^    \\  \\      |               ",
			"             /    /  /    / \\    \\  \\ ----|              ",
			"            /    /  /    /   \\    \\                       ",
			"           /____/  /____/     \\____\\                      ",
			"                                                            ",
		}

		local quote = inspire.get_quote()
		local centered_text = inspire.center_text(quote.text, quote.author, 52, 8, 52)

    for _, line_text in pairs(centered_text) do
      table.insert(header, line_text)
    end

		dashboard.section.header.val = header
		dashboard.section.buttons.val = {
			dashboard.button("f", "  > Find File", ":Telescope find_files<CR>"),
			dashboard.button("o", "  > Old File", ":Telescope oldfiles<CR>"),
			dashboard.button("w", "󱎸  > Ripgrep", ":Telescope live_grep<CR>"),
			dashboard.button("n", "󰁴  > Files", ":Oil<CR>"),
			-- dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
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
