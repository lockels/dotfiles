local spec = {
  {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      transparent_background = true,
      integrations = {
        telescope = {
          enabled = true,
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
        treesitter = true,
        notify = true,
        alpha = true,
        mason = true,
        neogit = true,
      },
    })
    end,
  },

  {
    "folke/tokyonight.nvim",
    name = "colors_tokyonight",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        transparent = false,

      })
    end,
  },

  { "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    variant = "moon", -- auto, main, moon, or dawn
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
        groups = {},
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}

vim.keymap.set("n", "<leader>uu", function() --> Show all custom colors in telescope...
  for _, color in ipairs(spec) do  --> Load all colors in spec....
    vim.cmd("Lazy load " .. color.name) --> vim colorschemes cannot be required...
  end

  vim.schedule(function() --> Needs to be scheduled:
    -- stylua: ignore
    local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
      "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
      "desert", "delek", "default", "darkblue", "blue" }

    local completion = vim.fn.getcompletion
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.fn.getcompletion = function() --> override
      return vim.tbl_filter(function(color)
        return not vim.tbl_contains(builtins, color) --
      end, completion("", "color"))
    end

    vim.cmd("Telescope colorscheme enable_preview=true")
    vim.fn.getcompletion = completion --> restore
  end)
end, { desc = "Telescope custom colors", silent = true })


return spec
