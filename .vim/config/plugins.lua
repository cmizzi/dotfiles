vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    -- Simplify management of vim configuration (https://github.com/jesseleite/vim-sourcery).
    use 'jesseleite/vim-sourcery'

    -- Colorscheme and statusbar.
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'dawn'

            -- Load colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end
    })

    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

    -- Syntax analysis and fixing
    use 'dense-analysis/ale'

    -- Quickstart config for the nvim LSP client
    use 'jubnzv/virtual-types.nvim'

    -- Telescope
    -- Telescope dependencies
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Telescope itself
    use 'nvim-telescope/telescope.nvim'

    -- fzf extension for fuzzy finding in Telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- nvim abstraction for tree-sitter (parser generator)
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Improve behaviour of built-in netrw
    use 'tpope/vim-vinegar'

    -- LSP.
    use {
        'neovim/nvim-lspconfig',
        requires = {
            {'ms-jpq/coq_nvim', branch = 'coq'},
            {'ms-jpq/coq.artifacts', branch = 'artifacts'},
        },
    }

    -- Comment.
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Trouble detector.
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Various plugins.
    use 'yamatsum/nvim-cursorline'
    use 'f-person/git-blame.nvim'
    use 'romgrk/barbar.nvim'
    use 'junegunn/vim-easy-align'
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'
    use 'gcmt/breeze.vim'
    use 'hrsh7th/nvim-compe'
    use { 'kana/vim-textobj-user' , requires = {'whatyouhide/vim-textobj-xmlattr'} }
    use 'mattn/emmet-vim'
    use 'preservim/nerdcommenter'
    use 'sheerun/vim-polyglot'
    use 'shime/vim-livedown'
    use 'tpope/vim-surround'
    use 'vim-test/vim-test'
    use 'jwalton512/vim-blade'
    use 'mhinz/vim-signify'
    use 'SirVer/ultisnips'
    use 'jiangmiao/auto-pairs'
    use 'steelsojka/headwind.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'ray-x/lsp_signature.nvim'
    use 'triglav/vim-visual-increment'
    use 'roryokane/detectindent'

    -- Godot specific.
    use 'calviken/vim-gdscript3'

    -- Crystal specific.
    use 'vim-crystal/vim-crystal'

    -- PHP Specific.
    use 'tobyS/vmustache'
    use { 'tobyS/pdv', ft = 'php' }
end)
