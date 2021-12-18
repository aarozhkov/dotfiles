local cmd = vim.cmd
DATA_PATH = vim.fn.stdpath("data")

-- Define global conf. It will be used as configu storage in all modules
conf = {
	lang = {
		python = {
			formatter = "autopep8",
			linter = "flake8",
		},
	},
}

require("plugins")
cmd("colo one-monokai")
cmd("set cursorline")
cmd("let g:gruvbox_italic = 1")
require("options")
require("utils")
require("configs")
require("keybindings")
local null_ls = require "null-ls"
null_ls.config({debug = true})
require("lspconfig")["null-ls"].setup({})
require("lsp")
require("languages.python").lsp()
require("languages.terraform").lsp()
require("languages.json").lsp()
require("languages.yaml").lsp()
