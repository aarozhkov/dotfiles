-- Lua language support configuration
-- TODO: Linting: luacheck

local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"
conf.lang.lua = {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 1000,
            },
        },
    },
}

local M = {}

-- Executable config closures for nvim-formatter
-- cargo install stylus
local stylua_fmt = function()
	return {
		exe = "stylua",
		args = {},
		stdin = false,
	}
end

-- Linters for nvim-lint
-- luarocs install luacheck
-- local linters = { "luacheck" } We not need linters for lua due LUA lsp handle it pretty good
local linters = {}

M.format = function()
	require("formatter.config").set_defaults({
		logging = false,
		filetype = { lua = { stylua_fmt } },
	})
end

M.lint = function()
	require("lint").linters_by_ft = {
		lua = linters,
	}
end

M.lsp = function()
	if require("utils").check_lsp_client_active("sumneko_lua") then
	  return
	end
	require("lspconfig").sumneko_lua.setup({
		cmd = conf.lang.lua.cmd,
		on_attach = require("lsp").common_on_attach,
		settings = conf.lang.lua.settings,
	})
end
return M
