vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Self-managed bundler.
  use { 'wbthomason/packer.nvim', opt = true }

  -- Simplify management of vim configuration.
  use 'jesseleite/vim-sourcery'

  -- Colorscheme.
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.g.rose_pine_variant = 'moon'
      vim.cmd('colorscheme rose-pine')
    end
  })

  -- Statusbar.
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Syntax analysis and fixing

  -- Telescope itself
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- nvim abstraction for tree-sitter (parser generator)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP.
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'lukas-reineke/cmp-under-comparator' },
      { 'ray-x/lsp_signature.nvim' },
      { 'jubnzv/virtual-types.nvim' },
    },
  }

  -- Snippets.
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } }

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
        --
      }
    end
  }

  -- Debugger.
  use 'mfussenegger/nvim-dap'

  -- Various plugins.
  use 'yamatsum/nvim-cursorline'
  use 'f-person/git-blame.nvim'
  use 'romgrk/barbar.nvim'
  use 'junegunn/vim-easy-align'
  use 'benmills/vimux'
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use 'jiangmiao/auto-pairs'
  use 'steelsojka/headwind.nvim'
  use 'triglav/vim-visual-increment'
  use 'roryokane/detectindent'
  use { 'kana/vim-textobj-user' , requires = {'whatyouhide/vim-textobj-xmlattr'} }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("gitsigns").setup()
    end
  }

  -- Godot specific.
  use 'calviken/vim-gdscript3'

  -- Crystal specific.
  use 'vim-crystal/vim-crystal'

  -- PHP Specific.
  use 'jwalton512/vim-blade'
end)
