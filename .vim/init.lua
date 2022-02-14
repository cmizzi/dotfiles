vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground' },
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        highlight = {
          enable = true,

          -- Temporary enable Vim regex for PHP because the tree-sitter is not smart enough to autoindent multilines
          -- comment block.
          additional_vim_regex_highlighting = { "php", "javascript" },
        },
        indent = {
          enable = true,

          -- Temporary disable auto-indent from tree-sitter because of the same reason as above.
          disable = { "php", "javascript" }
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

      parser_config.php.used_by = "blade";
    end
  }

  -- LSP.
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'williamboman/nvim-lsp-installer' },
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'David-Kunz/cmp-npm' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'lukas-reineke/cmp-under-comparator' },
      { 'ray-x/lsp_signature.nvim' },
      { 'jubnzv/virtual-types.nvim' },
      { 'onsails/lspkind-nvim' },
      {
        'kosayoda/nvim-lightbulb',
        config = function()
          vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
      }
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

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

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
  use 'vim-test/vim-test'
  use 'jiangmiao/auto-pairs'
  use 'steelsojka/headwind.nvim'
  use 'triglav/vim-visual-increment'
  use 'roryokane/detectindent'
  use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end }
  use { 'kana/vim-textobj-user' , requires = {'whatyouhide/vim-textobj-xmlattr'} }
  use { 'tpope/vim-surround' }
  use { 'jghauser/mkdir.nvim', config = function() require('mkdir') end }
  use {
    'windwp/nvim-ts-autotag',
    config = function ()
      require('nvim-ts-autotag').setup {
        autotag = {
          enable = true,
          filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'blade' },
        }
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("gitsigns").setup()
    end
  }
end)

vim.call('sourcery#init')
