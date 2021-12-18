vim.cmd('set iskeyword+=-')                  --treat dash separated words as a word text object"
vim.o.fileencoding="utf-8"                  --The encoding written to file
vim.go.t_Co="256"                            --Support 256 colors
vim.wo.signcolumn="yes"                      --Always show the signcolumn, otherwise it would shift the text each time
--vim.o.updatetime=300                      --Faster completion
--vim.o.timeoutlen=100                      --By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamed,unnamedplus"               --Copy paste between vim and everything else



vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd("set cursorline")

vim.o.encoding = 'utf8'
vim.o.backspace = 'indent,eol,start'
vim.o.wildmenu = true
vim.o.showmatch = true
vim.o.hidden = true
vim.o.splitright=true
vim.o.splitbelow=true

vim.o.mouse = 'a'

vim.cmd("syntax enable")
--vim.cmd("filetype plugin indent on")
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ruler = true
vim.o.showmatch = true
vim.o.wrap = false
vim.o.laststatus = 2


-- Tabulation rules
-- vim.o.autoindent = true
vim.o.smartindent = true
vim.o.textwidth = 120
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.scrolloff = 8
