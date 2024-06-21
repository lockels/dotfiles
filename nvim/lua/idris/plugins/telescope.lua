return {
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    defaults = {
      initial_mode = "insert",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      path_display = { "smart" },
      mappings = {
        i = {
        }
      }
    },
    extensions_list = { "fzf", "themes", "terms" },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end
}
