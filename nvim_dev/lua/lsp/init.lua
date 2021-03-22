local lspconfig = require('lspconfig')
-- }}}
-- ============================================================================
-- LSP Configuration {{{
-- ============================================================================
local options = {noremap = true, silent = true}

-- Native LSP
-- local ndiag = "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"
-- local pdiag = "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"
-- local sign = "<cmd>lua vim.lsp.buf.signature_help()<CR>"


-- LSPSAGA
local ndiag = "<cmd>Lspsaga diagnostic_jump_next<CR>"
local pdiag = "<cmd>Lspsaga diagnostic_jump_prev<CR>"
local sign = "<cmd>Lspsaga signature_help<CR>"
local hover = "<cmd>lua vim.lsp.buf.hover()<CR>"
local fmt = "<cmd>lua vim.lsp.buf.formatting()<CR>"
local defi = "<cmd>lua vim.lsp.buf.definition()<CR>"
local refe = "<cmd>lua vim.lsp.buf.references()<CR>"
local impli = "<cmd>lua vim.lsp.buf.implementation()<CR>"
local wrkspc = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"

local on_attach = function(client)

    vim.api.nvim_set_keymap('n', 'S', sign, options)
    -- Something wrong with Formating by binding
    vim.api.nvim_set_keymap("n", "gq", fmt, options)
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
lspconfig.pyright.setup {on_attach = on_attach}

-- Lua
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/workspace/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/workspace/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
-- Terraform
-- lspconfig.terraformls.setup{on_attach = on_attach}
-- lspconfig.yamlls.setup{
--   on_attach = on_attach,
-- }
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
-- lua
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
-- JavaScript/React/TypeScript
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- local prettier_yaml = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- local eslint = {
--     lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
--     lintIgnoreExitCode = true,
--     lintStdin = true,
--     lintFormats = {"%f:%l:%c: %m"},
--     formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--     formatStdin = true
-- }
-- local shellcheck = {
--     LintCommand = 'shellcheck -f gcc -x',
--     lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
-- }
-- local shfmt = {
--   formatCommand = 'shfmt -ci -s -bn',
--   formatStdin = true
-- }

require"lspconfig".efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"python", "lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            python = {flake8, isort, yapf}
        }
    }
}
