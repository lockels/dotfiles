local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
vim.diagnostic.config({
	float = {
		border = "rounded",
	},
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.INFO] = signs.Info,
			[vim.diagnostic.severity.HINT] = signs.Hint,
		},
	},
})
