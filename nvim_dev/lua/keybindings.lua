-- Split navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})


-- Terminal
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- NERDTree
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>NERDTreeFocus<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>NERDTreeClose<CR>', {silent = true})
