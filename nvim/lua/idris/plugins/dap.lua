-- Debugging.
return {
  "mfussenegger/nvim-dap",
  cmd = "Debug",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },

  config = function ()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()

    require('dap-python').setup("/Library/Frameworks/Python.framework/Versions/3.10/bin/python3")

    dap.listeners.before.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dt', dap.continue, {})
  end,
}
