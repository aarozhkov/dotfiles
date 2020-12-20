local lspconfig = require('lspconfig')
local completion = require('completion')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}
local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
-- local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local refe =  "<cmd>lua vim.lsp.buf.references()<CR>"
local sign = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"

local on_attach=function(client)
  completion.on_attach(client)

  vim.api.nvim_set_keymap('n', 'S', sign, options)
  -- Something wrong with Formating by binding
  -- vim.api.nvim_set_keymap("n", "gq", fmt, options)
  vim.api.nvim_set_keymap("n", "gd", defi, options)
  vim.api.nvim_set_keymap("n", "gr", refe, options)
  vim.api.nvim_set_keymap("n", "K", hover, options)
  vim.api.nvim_set_keymap('n', 'gD', impli, options)
  vim.api.nvim_set_keymap('n', 'gW', wrkspc, options)
  vim.api.nvim_set_keymap("n", "gp", pdiag, options)
  vim.api.nvim_set_keymap("n", "gn", ndiag, options)
end

vim.lsp.set_log_level("trace")

-- Python
lspconfig.pyls.setup{
  settings = {
    pyls = {
      plugins = {
        yapf = { enabled = true}
      }
    }
  },
  on_attach = on_attach,
  cmd = {"pyls", "--log-file", "/tmp/pyls.log", "-vv"},
}
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

-- Lua
lspconfig.sumneko_lua.setup{on_attach = on_attach}

-- Terraform
lspconfig.terraformls.setup{on_attach = on_attach}
