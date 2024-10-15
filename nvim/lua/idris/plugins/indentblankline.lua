return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    scope = {
      show_start = false,
    },
  },

  config = function()
    require "ibl".overwrite {
      exclude = { filetypes = { "python" } }
    }
  end,
}
