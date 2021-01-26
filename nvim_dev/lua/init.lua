vim.cmd('colo gruvbox')
vim.cmd('let g:gruvbox_italic = 1')
require('options')
require('lsp') -- build in lsp configurations
require('plugin.treesitter')
require('plugin.telescope')
-- Coc = require('plugin.coc')
