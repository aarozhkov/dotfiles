local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("general.lsp.lsp-installer")
require("general.lsp.handlers").setup()
require("general.lsp.nullls")



-- TODO: separate autocommand?
-- Format on save
vim.cmd [[
  augroup format_on_save
    autocmd!
    autocmd BufWritePre * :silent lua vim.lsp.buf.formatting_sync({}, 1000)
  augroup end
]]
