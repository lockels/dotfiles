return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  dependencies = {},
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
      },
    })
  end,
}
