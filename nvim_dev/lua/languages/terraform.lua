conf.lang.terraform = {
    cmd = {
        DATA_PATH .. "/lspinstall/terraform/terraform-ls",
        "serve",
    },
}

local M = {}

M.lsp = function()
    local null_ls = require "null-ls"
    null_ls.register {sources = {null_ls.builtins.formatting.terraform_fmt}}
	require("lspconfig").terraformls.setup({
		cmd = conf.lang.terraform.cmd,
		on_attach = require("lsp").common_on_attach,
        root_dir = function(fname)
            return vim.fn.getcwd()
        end
	})
end

return M
