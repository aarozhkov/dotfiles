local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("general.lsp.lsp-installer")
require("general.lsp.handlers").setup()
require("general.lsp.nullls")
