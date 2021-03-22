-- local telescope_builtin = require('telescope.builtin')
-- local options = {noremap = true, silent = true}
vim.cmd('nnoremap <leader>ff <cmd>Telescope fd<cr>')
vim.cmd('nnoremap <leader>fg <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>fb <cmd>Telescope buffers<cr>')
vim.cmd('nnoremap <leader>fh <cmd>Telescope help_tags<cr>')
