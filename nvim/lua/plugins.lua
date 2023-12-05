-- Install Packer automatically if it's not installed(Bootstraping)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- pip modules
-- pylsp-rope

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use { 'SirVer/ultisnips', config = [[require('config.ultisnips')]] }
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'wbthomason/packer.nvim'
    use {'folke/which-key.nvim', config = [[require('config.which-key')]]}
    use 'BurntSushi/ripgrep'
    use 'tanvirtin/monokai.nvim'
    use { "terrortylor/nvim-comment", config = [[require('config.nvim_comment')]] }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = [[require('config.telescope')]]
    }
    use { 'github/copilot.vim' }
    use { 'ThePrimeagen/harpoon',
        config = [[require('config.harpoon')]],
        requires = { {"nvim-lua/plenary.nvim"} }}
    use { 'mbbill/undotree', config = [[require('config.undotree')]]}
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'tpope/vim-fugitive', config = [[require('config.vim-fugitive')]] }
    use { "akinsho/toggleterm.nvim", tag = '*', config = [[require('config.terminal')]] }
    use 'folke/neodev.nvim'
    use { 'nvim-treesitter/nvim-treesitter', config = [[require('config.treesitter')]] }
    use { 'mfussenegger/nvim-dap', config = [[require('config.dap')]],
        requires = {
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'ldelossa/nvim-dap-projects'
        }
    }


    -- Automatically set up your configuration\ after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
