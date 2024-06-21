return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_view_method = "zathura"
  end
}
