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
      require('rose-pine').setup({
        dark_variant = 'moon',
      })

      vim.cmd('colorscheme rose-pine')
    end
  })

  -- Noice.
--  use({
--    "folke/noice.nvim",
--    event = "VimEnter",
--    config = function()
--      require("noice").setup({
--        views = {
--          cmdline_popup = {
--            position = {
--              row = 5,
--              col = "50%",
--            },
--            size = {
--              width = 60,
--              height = "auto",
--            },
--          },
--          popupmenu = {
--            relative = "editor",
--            position = {
--              row = 8,
--              col = "50%",
--            },
--            size = {
--              width = 60,
--              height = 10,
--            },
--            border = {
--              style = "rounded",
--              padding = { 0, 1 },
--            },
--            win_options = {
--              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
--            },
--          },
--        },
--        routes = {
--          {
--            filter = {
--              event = "msg_show",
--              kind = "",
--              find = "written",
--            },
--            opts = { skip = true },
--          },
--        },
--      })
--    end,
--    requires = {
--      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--      "MunifTanjim/nui.nvim",
--      use({
--        "rcarriga/nvim-notify",
--        config = {
--          require("notify").setup {
--            stages = 'fade_in_slide_out',
--            timeout = 3000,
--            max_width = 50,
--            top_down = false,
--          }
--        }
--      }),
--    }
--  })

  -- Statusbar.
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Syntax analysis and fixing

  -- Telescope itself
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      require("telescope")
    end
  }

  -- nvim abstraction for tree-sitter (parser generator)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground' },
      { "IndianBoy42/tree-sitter-just", opt = true },
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
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
          enable = false,
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

      parser_config.php.filetype_to_parsername = "blade";
    end
  }

  -- Fallback if there's no Treesitter configuration for a specific language.
  use 'sheerun/vim-polyglot'

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
  use 'junegunn/vim-easy-align'
  use 'benmills/vimux'
  use 'christoomey/vim-tmux-navigator'
  use 'vim-test/vim-test'
  use 'jiangmiao/auto-pairs'
  use 'steelsojka/headwind.nvim'
  use 'triglav/vim-visual-increment'
  use 'towolf/vim-helm'
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
  use 'simrat39/rust-tools.nvim'
end)

vim.call('sourcery#init')
