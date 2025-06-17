local keymap = vim.keymap

-------- Preferences --------

-- Disable search highlighting on <Esc>
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- bufffer navigation
keymap.set("n", "<leader>bd", "<cmd>bdelete!<CR>", { desc = "force close current bufffer" })

-- smooth half page scrolling
keymap.set("n", "<C-D>", "<C-D>zz", { noremap = true })
keymap.set("n", "<C-U>", "<C-U>zz", { noremap = true })

-- Move selected line / block of text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-------- Plugins --------

-- Telescope --
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find file in the cwd" })
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep in the cwd" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Browse help tags" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Browse old files" })

-- Alpha --
keymap.set("n", "<leader>mm", "<cmd>Alpha | silent only<CR>", { desc = "Load neovim menu" })

-- ZenMode --
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" }) -- Automatially enebales twilight
keymap.set("n", "<leader>zx", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- Notify --
keymap.set("n", "<leader>fe", "<cmd>Telescope noice<CR>", { desc = "View notify messages in telescope" })
keymap.set("n", "<leader>pp", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss notify messages" })
