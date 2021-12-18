-- Yaml support configuration
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
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
		stdin = true,
	}
end

M.format = function()
	require("formatter.config").set_defaults({
		logging = false,
		filetype = { yaml = { prettier_fmt } },
	})
end

M.lint = function()
	-- TODO: implement linters (if applicable)
	return "No linters configured!"
end

M.lsp = function()
	if require("utils").check_lsp_client_active("yamlls") then
		return
	end

	-- LspInstall yaml
	require("lspconfig").yamlls.setup({
		cmd = { DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio" },
		on_attach = require("lsp").common_on_attach,
	})
end

M.dap = function()
	-- TODO: implement dap
	return "No DAP configured!"
end

return M
