local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

execute("packadd packer.nvim")

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- use 'tpope/vim-sensible' " Sensible defaults
	-- use 'rstacruz/vim-opinion' " More sensible defaults

	-- Themes
	use("morhetz/gruvbox")
	use("fratajczak/one-monokai-vim")
	-- Themes end

	-- Git
	use("tpope/vim-fugitive") -- Git Support
	use("lewis6991/gitsigns.nvim")

	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("terrortylor/nvim-comment") -- 'gc/gcc' to comment
	-- use 'vim-python/python-syntax'
	use("Vimjas/vim-python-pep8-indent")
	use("preservim/nerdtree")
	-- use 'pedrohdz/vim-yaml-folds'

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("honza/vim-snippets")
	use("hrsh7th/nvim-compe")

	-- Lasy language support load

	-- Syntx highlight
	use("nvim-treesitter/nvim-treesitter")

	-- Nvim build-in LSP configuration/wrapping
	use("neovim/nvim-lspconfig")
	use("glepnir/lspsaga.nvim")

	-- Use lspinstall module provide single place for
	-- all servers in vim.fn.stdpath('data') no need to handle outside of VIM
	use{
        "kabouzeid/nvim-lspinstall",
        event = "VimEnter",
        config = function()
            require('lspinstall').setup()
        end

    }

	use("jose-elias-alvarez/null-ls.nvim")
end)
