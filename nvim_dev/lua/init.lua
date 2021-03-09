vim.cmd('colo gruvbox')
vim.cmd('let g:gruvbox_italic = 1')
require('options')
require('lsp') -- build in lsp configurations
require('plugin.treesitter')
require('plugin.telescope')
-- Coc = require('plugin.coc')
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { complete_items = { 'ts' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}
