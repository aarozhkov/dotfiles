-- Python language support configuration
-- TODO: Linting: pylint, flake8 - exit code, all flake lints = errors
-- TODO: Prject specific configurations
--
-- executables must be available for nvim runtime

conf.lang.python = {
    cmd = {
        DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
        "--stdio",
    },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
        }),
    },
    -- pyright configuration
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}

local M = {}

M.lsp = function()
	-- if require("lv-utils").check_lsp_client_active "pyright" then
	--   return
	-- end
	-- npm i -g pyright
    local null_ls = require "null-ls"
    null_ls.register {sources = {null_ls.builtins.formatting.autopep8, null_ls.builtins.formatting.isort}}
	require("lspconfig").pyright.setup({
		cmd = conf.lang.python.cmd,
		on_attach = require("lsp").common_on_attach,
		handlers =  conf.lang.python.handlers,
		settings =  conf.lang.python.settings,
	})
end

return M
-- M.lsp()
