local lsp = vim.lsp

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
	return hover({
		border = "rounded",
		title = "Documentation",
		max_width = math.floor(vim.o.columns * 0.7),
		max_height = math.floor(vim.o.lines * 0.7),
	})
end

local signature_help = vim.lsp.buf.signature_help

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
	return signature_help({
		border = "rounded",
		title = "Signature",
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- "hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		require("lspconfig.ui.windows").default_options.border = "rounded"

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "Show LSP document symbol"
				keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp type definitions

				opts.desc = "Show LSP workspace symbols"
				keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = lsp.protocol.make_client_capabilities()

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						features = "all", -- Enable all features by default
					},
					checkOnSave = {
						command = "check", -- or "clippy" if you prefer clippy
						extraArgs = { "--all-features" }, -- Make sure all features are included in `check`
					},
				},
			},
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		-- 	["clangd"] = function()
		-- 		lspconfig["clangd"].setup({
		-- 			capabilities = capabilities,
		-- 		})

		-- mason_lspconfig.setup_handlers({
		-- 	-- default handler for installed servers
		-- 	function(server_name)
		-- 		lspconfig[server_name].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Typscript
		-- 	["ts_ls"] = function()
		-- 		lspconfig["ts_ls"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Html
		-- 	["html"] = function()
		-- 		lspconfig["html"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Tailwind
		-- 	["tailwindcss"] = function()
		-- 		lspconfig["tailwindcss"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- eslint
		-- 	["eslint"] = function()
		-- 		lspconfig["eslint"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Kotlin
		-- 	["kotlin_language_server"] = function()
		-- 		lspconfig["kotlin_language_server"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Python
		-- 	["pyright"] = function()
		-- 		lspconfig["pyright"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- C / C++
		-- 	["clangd"] = function()
		-- 		lspconfig["clangd"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- C#
		-- 	["csharp_ls"] = function()
		-- 		lspconfig["csharp_ls"].setup({
		-- 			capabilities = capabilities,
		-- 			cmd = { "~/.local/share/nvim/mason/bin/chsharp-ls" },
		-- 		})
		-- 	end,
		-- 	-- Haskell
		-- 	["hls"] = function()
		-- 		lspconfig["hls"].setup({
		-- 			capabilities = capabilities,
		-- 			handlers = {
		-- 				["window/showMessage"] = function(_, result, ctx, config)
		-- 					if result.type <= vim.lsp.protocol.MessageType.Log then
		-- 						return
		-- 					end
		-- 					vim.lsp.handlers["window/showMessage"](_, result, ctx, config)
		-- 				end,
		-- 			},
		-- 		})
		-- 	end,
		-- 	-- Rust
		-- 	["rust_analyzer"] = function()
		-- 		lspconfig["rust_analyzer"].setup({
		-- 			capabilities = capabilities,
		-- 			root_dir = lspconfig.util.root_pattern("Cargo.toml"),
		-- 			settings = {
		-- 				["rust-analyzer"] = {
		-- 					cargo = {
		-- 						features = "all", -- Enable all features by default
		-- 					},
		-- 					checkOnSave = {
		-- 						command = "check", -- or "clippy" if you prefer clippy
		-- 						extraArgs = { "--all-features" }, -- Make sure all features are included in `check`
		-- 					},
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- 	-- Java
		-- 	["jdtls"] = function()
		-- 		lspconfig["jdtls"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	--Latex
		-- 	["texlab"] = function()
		-- 		lspconfig["texlab"].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- Lua
		-- 	["lua_ls"] = function()
		-- 		lspconfig["lua_ls"].setup({
		-- 			capabilities = capabilities,
		-- 			settings = {
		-- 				Lua = {
		-- 					-- make the language server recognize "vim" global
		-- 					diagnostics = {
		-- 						globals = { "vim" },
		-- 					},
		-- 					completion = {
		-- 						callSnippet = "Replace",
		-- 					},
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- })
	end,
}
