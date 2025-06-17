vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', ':silent !tmux split-window -h "cargo run; exec $SHELL"<CR>', { noremap = true, silent = true })
