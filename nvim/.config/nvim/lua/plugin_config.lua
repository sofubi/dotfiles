return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'hrsh7th/nvim-compe',
    config = function ()
      require('plugins.compe')
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
    'ggandor/lightspeed.nvim',
    requires = 'tpope/vim-repeat',
    config = function()
      require('plugins.lightspeed')
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
    'glepnir/lspsaga.nvim',
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
    'oberblastmeister/neuron.nvim',
    branch = 'unstable',
    config = function()
      require('plugins.neuron')
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
    'norcalli/snippets.nvim',
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
    'simrat39/symbols-outline.nvim',
    config = function ()
      require('plugins.symbols_outline')
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
    'mfussenegger/nvim-dap',
    config = function()
      require('plugins.dap')
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
    'alexaandru/nvim-lspupdate'
  }

  use {
    'ray-x/lsp_signature.nvim'
  }

  use {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup{
        themeStyle='light',
        transparent=true
      }
    end
  }

  use {
    'mhinz/vim-startify',
  }
end)
