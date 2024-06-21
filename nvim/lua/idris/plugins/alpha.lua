return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "  _____   _____                         ",
      "  \\    \\  \\    \\                    ",
      "   \\    \\  \\    \\      Neovim :)    ",
      "    \\    \\  \\    \\                  ",
      "     \\    \\  \\    \\  \\-----------| ",
      "      \\    \\  \\    \\  \\          | ",
      "       \\    \\  \\    \\  \\---------| ",
      "       /    /  /     \\                 ",
      "      /    /  /       \\  \\-------|    ",
      "     /    /  /    ^    \\  \\      |    ",
      "    /    /  /    / \\    \\  \\ ----|   ",
      "   /    /  /    /   \\    \\            ",
      "  /____/  /____/     \\____\\           ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button( "f", "󰥩  > Find File", ":Telescope find_files<CR>"),
      dashboard.button( "o", "  > Old File"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "w", "󱎸  > Ripgrep"   , ":Telescope live_grep<CR>"),
      dashboard.button( "b", "󰁴  > Oil"   , ":Oil --float<CR>"),
      dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button( "q", "󰅝  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
