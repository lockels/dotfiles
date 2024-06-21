return {

  -- Smaller plugins

  "nvim-lua/plenary.nvim",

  -- zen-mode and twilight --

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
      require("zen-mode").setup()
    end,
  },

  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    config = function()
      require("twilight").setup()
    end,
  },

  -- utils and quality of life --


  {
    "letieu/harpoon-lualine",
    event = "VeryLazy",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  },

  -- {
  --   "chrisgrieser/nvim-recorder",
  --   dependencies = "rcarriga/nvim-notify",
  --   opts = {},
  --   config = function()
  --     require("recorder").setup({})
  --   end,
  -- },

  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  -- },
}
