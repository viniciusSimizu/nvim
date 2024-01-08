vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 
		'catppuccin/nvim', 
		as = 'catppuccin',
		config = function()
			vim.cmd('colorscheme catppuccin')
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'mbbill/undotree'

	use {
		'williamboman/mason.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason-lspconfig.nvim'},
			{'mfussenegger/nvim-lint'},
			{'mhartington/formatter.nvim'},
			{'mfussenegger/nvim-dap'},
			{'rcarriga/nvim-dap-ui'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'L3MON4D3/LuaSnip'},
			{'saadparwaiz1/cmp_luasnip'}
		}
	}

	use {'christoomey/vim-tmux-navigator'}

	use {'lewis6991/gitsigns.nvim'}

	use {'theprimeagen/harpoon'}
end)
