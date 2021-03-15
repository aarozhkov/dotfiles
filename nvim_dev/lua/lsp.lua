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
-- lspconfig.pyright.setup{on_attach = on_attach}
lspconfig.pyls.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false,
        underline = true,
      }
    ),
  },
  settings = {
    pyls = {
      plugins = {
        pylint = { enabled = false},
        yapf = { enabled = false},
        autopep8 = { enabled = false},
        flake8 = { enabled = true},
        pyls_mypy = {
            enabled = true,
          },
      }
    }
  },
  on_attach = on_attach,
  -- cmd = {"pyls"},
  cmd = {"/home/aarozhkov/.pyenv/versions/3.8.7/bin/pyls", "--log-file", "/tmp/pyls.log", "-vv"},
}
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

-- Lua
lspconfig.sumneko_lua.setup {
  cmd = {'/usr/bin/lua-language-server'};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

-- Terraform
lspconfig.terraformls.setup{on_attach = on_attach}
lspconfig.yamlls.setup{
  on_attach = on_attach,
}
