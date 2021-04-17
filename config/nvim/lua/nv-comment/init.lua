require('nvim_comment').setup()
vim.api.nvim_set_keymap("n", "gcc", ":CommentToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("v", "gcc", ":CommentToggle<CR>", {noremap=true, silent = true})
