local opt = vim.opt
local g = vim.g

-- Releative line numbers
opt.relativenumber = true
opt.number = true

-- Guiding line on cursor
opt.cursorline = true

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Save undo history
opt.undofile = true
opt.wrap = false

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- turn on mouse
opt.mouse = "a"

-- Disable built in mode status
opt.showmode = false

-- Enable break indent
opt.breakindent = true

opt.termguicolors = true
opt.background = "dark"

-- use system clipboard as default register
opt.clipboard:append("unnamedplus")

-- backspace
opt.backspace = "indent,eol,start"

-- disable nvim start screen
opt.shortmess:append("sI")

-- disable tildes on unused lines
opt.fillchars:append({ eob = " " })

-- set <leader> key to space
g.mapleader = " "
g.maplocalleader = " "

-- decrease update time
opt.updatetime = 250

-- minimum number of lines on screeen
opt.scrolloff = 10
opt.signcolumn = "yes"

-- splits
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 3

-- visual representation of substitute
opt.inccommand = "split"

-- Set highlight on search
opt.hlsearch = true

-- fix visual block mode with virutaledit
opt.virtualedit = "block"

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

----- Indent Settings -----

local indent_settings = {
	java = { shiftwidth = 4, tabstop = 4 },
}

------ Auto Commands ------

-- automatically close nvim tree if its the last buffer

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

-- Apply indent settings

for filetype, settings in pairs(indent_settings) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			for option, value in pairs(settings) do
				vim.bo[option] = value
			end
		end,
	})
end

-- Highlight on yank

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Define an autocommand group for closing buffers with 'q'
vim.api.nvim_create_augroup("CloseWithQ", { clear = true })

-- Create an autocommand for the specified filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = "CloseWithQ",
	pattern = { "help", "lspinfo", "qf", "man", "oil" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", ":bd<CR>", { noremap = true, silent = true })
	end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- Close help buffers with q

------ User Commands ------

local user_cmd = vim.api.nvim_create_user_command
