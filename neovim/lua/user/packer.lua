vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } )
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use ({
      "theHamsta/nvim-dap-virtual-text",
      config = function()
          require("nvim-dap-virtual-text").setup {
            enabled = true,
            enabled_commands = false,
            highlight_changed_variables = true,
            highlight_new_as_changed = true,
            commented = true,
        }
      end
  })
  use ({
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
          require("nvim-surround").setup()
      end
  })
  use 'tpope/vim-fugitive'
  use 'tpope/vim-abolish'
  use 'tpope/vim-repeat'
  use 'chaoren/vim-wordmotion'
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  }
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'github/copilot.vim'
  use 'unblevable/quick-scope'
  use {
	  "windwp/nvim-autopairs",
	  config = function() require("nvim-autopairs").setup {} end
  }
  use {
		  'VonHeikemen/lsp-zero.nvim',
		  requires = {
				  -- LSP Support
				  {'neovim/nvim-lspconfig'},
				  {'williamboman/mason.nvim'},
				  {'williamboman/mason-lspconfig.nvim'},

				  -- Autocompletion
				  {'hrsh7th/nvim-cmp'},
				  {'hrsh7th/cmp-buffer'},
				  {'hrsh7th/cmp-path'},
				  {'saadparwaiz1/cmp_luasnip'},
				  {'hrsh7th/cmp-nvim-lsp'},
				  {'hrsh7th/cmp-nvim-lua'},

				  -- Snippets
				  {'L3MON4D3/LuaSnip'},
				  {'rafamadriz/friendly-snippets'},
		  }
  }
  use "mfussenegger/nvim-dap"
  use 'mfussenegger/nvim-dap-python'
  use "jayp0521/mason-nvim-dap.nvim"
  use "nvim-telescope/telescope-dap.nvim"
  use 'mfussenegger/nvim-lint'
  use "mhartington/formatter.nvim"
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }
  use 'simrat39/rust-tools.nvim'
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use({
    'mikesmithgh/kitty-scrollback.nvim',
    disable = false,
    opt = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    config = function()
      require('kitty-scrollback').setup(
      )
    end,
  })
end)
