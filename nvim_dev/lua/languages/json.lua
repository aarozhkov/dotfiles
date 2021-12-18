-- JSON support configuration
-- TODO: Formating: prettier
-- TODO: LSP
-- TODO: identation
-- executables must be available for nvim runtime

local M = {}

-- Executable config closures for nvim-formatter
-- npm install -g prettier
local prettier_fmt = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	}
end

M.format = function()
	require("formatter.config").set_defaults({
		logging = false,
		filetype = { json = { prettier_fmt } },
	})
end

M.lint = function()
	-- TODO: implement linters (if applicable)
	return "No linters configured!"
end

M.lsp = function()
	if require("utils").check_lsp_client_active("jsonls") then
		return
	end

	-- LspInstall json
	require("lspconfig").jsonls.setup({
		cmd = {
			"node",
			DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
			"--stdio",
		},
		on_attach = require("lsp").common_on_attach,

		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	})
end

M.dap = function()
	-- TODO: implement dap
	return "No DAP configured!"
end

return M
