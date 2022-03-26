return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
    },
    config = function ()
      require('plugins.completion')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function ()
      require('plugins.gitsigns')
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent_guides')
    end
  }

  use {
    'justinmk/vim-sneak',
    config = function()
      require('plugins.sneak')
    end
  }


  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end
  }

  use {
    'onsails/lspkind-nvim',
    config = function ()
      require('plugins.lspkind')
    end
  }

  use {
    'tami5/lspsaga.nvim',
    config = function ()
      require('plugins.lspsaga')
    end
  }

  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('plugins.neogit')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('plugins.nvimtree')
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins.snippets')
    end
  }

  use {
    'windwp/nvim-spectre',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
    config = function()
      require('plugins.spectre')
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require('plugins.statusline')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function ()
      require('plugins.telescope')
    end
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('plugins.toggleterm')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end,
    run = ':TSUpdate'
  }

  use {
    'jiangmiao/auto-pairs',
  }

  use {
    'p00f/nvim-ts-rainbow'
  }

  use {
    'tpope/vim-surround',
  }

  use {
    'vim-scripts/ReplaceWithRegister'
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require'nvim-ts-autotag'.setup()
    end
  }

  use {
    'tpope/vim-commentary',
  }

  use {
    'williamboman/nvim-lsp-installer',
  }

  use {
    'ray-x/lsp_signature.nvim'
  }

  use {
    'Vimjas/vim-python-pep8-indent'
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.trouble')
    end
  }

  use {
    'stevearc/aerial.nvim',
    config = function ()
      require('plugins.aerial')
    end
  }

  use {
    'hrsh7th/cmp-path'
  }

  use {
    'saadparwaiz1/cmp_luasnip'
  }

  use {
    'catppuccin/nvim',
    as = 'catpuccin',
    config = function ()
      require('catppuccin').setup({
        integrations = {
          lsp_trouble = true,
          lsp_saga = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          neogit = true,
          vim_sneak = true,
          ts_rainbow = true,
        }
      })
    end
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function ()
      require('plugins.tabline')
    end
  }

  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('plugins.dashboard')
    end
  }

  use {
    'mfussenegger/nvim-lint',
    config = function()
      require('plugins.linting')
    end
  }
end)
