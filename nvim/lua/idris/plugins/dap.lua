-- Debugging.
return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		vim.fn.sign_define("DapBreakpoint", { text = " " })
		ui.setup()

		require("nvim-dap-virtual-text").setup({})

		dap.listeners.before.event_initialized["dapui_config"] = function()
			ui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			ui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			ui.close()
		end

		-- Configurations for different languages.

		dap.adapters.codelldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.getcwd() .. "/target/debug/rust"
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = { "--all-features" },
			},
			{
				name = "temporal tests",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.getcwd() .. "/target/debug/deps/temporal_rs-23064dd8d13d0644"
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		dap.adapters.debugpy = {
			type = "executable",
			command = "~/.local/share/nvim/mason/bin/debugpy-adapter",
		}

		dap.configurations.python = {
			{
				name = "Launch file",
				type = "debugpy",
				request = "launch",
				program = "${file}",
			},
		}

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dt", dap.continue, {})
	end,
}
