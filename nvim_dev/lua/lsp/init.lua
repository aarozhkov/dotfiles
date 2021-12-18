local options = { noremap = true, silent = true }

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

vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

vim.lsp.set_log_level("trace")

local M = {}
M.common_on_attach = function(client)
	vim.api.nvim_set_keymap("n", "S", sign, options)
	-- Something wrong with Formating by binding
	vim.api.nvim_set_keymap("n", "gq", fmt, options)
	vim.api.nvim_set_keymap("n", "gd", defi, options)
	vim.api.nvim_set_keymap("n", "gr", refe, options)
	vim.api.nvim_set_keymap("n", "K", hover, options)
	vim.api.nvim_set_keymap("n", "gD", impli, options)
	vim.api.nvim_set_keymap("n", "gW", wrkspc, options)
	vim.api.nvim_set_keymap("n", "gp", pdiag, options)
	vim.api.nvim_set_keymap("n", "gn", ndiag, options)
end

return M
