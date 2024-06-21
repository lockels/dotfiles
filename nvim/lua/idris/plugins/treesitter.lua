return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile", },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "python",
        "haskell",
        "java",
        "rust",
      },

      modules = {},

      ignore_install = {},

      auto_install = false,

      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
    })
  end
}
