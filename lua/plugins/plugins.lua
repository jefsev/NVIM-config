-- Ensure packer.nvim is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- UI plugins
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'vim-airline/vim-airline'
    use 'akinsho/toggleterm.nvim'

    -- Telescope with plenary as a dependency
    use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP plugins
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- DAP plugins
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
	use 'nvim-neotest/nvim-nio'
	use 'jay-babu/mason-nvim-dap.nvim'

    -- Formatting plugins
    use 'mhartington/formatter.nvim'

    -- Utility plugins
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-fugitive'
    use 'jiangmiao/auto-pairs'
    use 'sheerun/vim-polyglot'

    if packer_bootstrap then
        require('packer').sync()
    end
end)




























































