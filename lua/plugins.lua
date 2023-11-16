return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Design
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	})
	use("romgrk/barbar.nvim")
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("lualine").setup({})
		end,
	})
	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({})
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	})

	-- Navigation
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use({ "christoomey/vim-tmux-navigator" })

	-- Coding
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("mhartington/formatter.nvim")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	})
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
	use({
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	})
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "nvimdev/lspsaga.nvim" })
end)
