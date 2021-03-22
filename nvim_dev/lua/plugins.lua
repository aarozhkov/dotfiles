local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

execute 'packadd packer.nvim'

return require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    -- use 'tpope/vim-sensible' " Sensible defaults
    -- use 'rstacruz/vim-opinion' " More sensible defaults

    -- Themes
    use 'morhetz/gruvbox'
    -- Themes end

    -- Git
    use 'tpope/vim-fugitive' -- Git Support
    use 'lewis6991/gitsigns.nvim'

    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'terrortylor/nvim-comment' -- 'gc/gcc' to comment
    -- use 'vim-python/python-syntax'
    use 'Vimjas/vim-python-pep8-indent'
    use 'preservim/nerdtree'
    -- use 'pedrohdz/vim-yaml-folds'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'honza/vim-snippets'
    use 'hrsh7th/nvim-compe'

    -- Nvim build-in LSP support
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use 'glepnir/lspsaga.nvim'

end)
