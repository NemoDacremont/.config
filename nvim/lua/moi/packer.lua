-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  use 'shaunsingh/nord.nvim'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use 'nvim-treesitter/playground'

  use 'ThePrimeagen/harpoon'

  use 'mbbill/undotree'

  use "tpope/vim-fugitive"

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

	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	use "lukas-reineke/indent-blankline.nvim"

	use 'vim-airline/vim-airline'

	-- nvim Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use 'folke/tokyonight.nvim'
	use 'EdenEast/nightfox.nvim'

	use "rebelot/kanagawa.nvim"
	use 'artanikin/vim-synthwave84'
	use 'jaredgorski/spacecamp'
	use 'ayu-theme/ayu-vim'
	use 'navarasu/onedark.nvim'

	use 'norcalli/nvim-colorizer.lua'

	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}

	use 'lervag/vimtex'


end)

