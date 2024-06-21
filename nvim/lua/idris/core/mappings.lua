local keymap = vim.keymap

-------- Preferences -------- 

-- bufffer navigation
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", {desc = "swap to previous bufffer"})
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", {desc = "swap to next bufffer"})
keymap.set("n", "<leader>bdd", "<cmd>bdelete<CR>", {desc = "close current bufffer"})
keymap.set("n", "<leader>bd!", "<cmd>bdelete!<CR>", {desc = "force close current bufffer"})

keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", {desc = "delete current bufffer"})
keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", {desc = "delete current bufffer"})

-- smooth half page scrolling
keymap.set('n', '<C-U>', '<C-U>zz', { noremap = true })
keymap.set('n', '<C-D>', '<C-D>zz', { noremap = true })

-------- Plugins -------- 

-- Telescope -- 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find in the cwd" })
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep in the cwd" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Browse help tags" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Browse old files" })

-- Alpha -- 
keymap.set("n", "<leader>mm", "<cmd>Alpha | only<CR>", { silent =true, desc = "Load neovim menu" } )

-- ZenMode -- 
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
keymap.set("n", "<leader>zx", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- Notify -- 
keymap.set("n", "<leader>pp", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss nvim-notify messages"})
keymap.set("n", "<leader>fe", "<cmd>Telescope noice<CR>", { desc = "Dismiss nvim-notify messages"})
