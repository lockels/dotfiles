return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    require("noice").setup({
      views = {
        cmdline_popup = {
          position = {
            row = 15,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 18,
            col = "50%",
          },
          size = {
            width = 60,
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

      require("notify").setup({
        background_colour = "#000000",
        timeout = 3000,
        render = "compact",
        stages = "fade_in_slide_out",
      }),

      cmdline = {
        format = {
          help = { pattern = { "^:%s*he?l?p?%s+", "FloatingHelp " }},
          search_down = {
            icon = "󰍉",
          },
          search_up = {
            icon = "󰍉",
          },
        },
      },

    })
  end
}
