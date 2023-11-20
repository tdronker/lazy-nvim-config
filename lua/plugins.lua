require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- ============================== Plugin Category: Design ==============================
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
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	})
	use({
		"echasnovski/mini.animate",
		config = function()
			require("mini.animate").setup()
		end,
	})
	use({
		"echasnovski/mini.starter",
		config = function()
			require("mini.starter").setup()
		end,
	})
	use({
		"echasnovski/mini.cursorword",
		config = function()
			require("mini.cursorword").setup()
		end,
	})

	-- ============================== Plugin Category: Navigation ==============================
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use({ "christoomey/vim-tmux-navigator" })
	use({ "justinmk/vim-sneak" })
	use({ "easymotion/vim-easymotion" })
	use({
		"echasnovski/mini.map",
		config = function()
			require("mini.map").setup({
				default_mappings = true,
				default_mappings_visual = true,
			})
		end,
	})

	-- ============================== Plugin Category: Coding ==============================
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
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use({ "zbirenbaum/copilot.lua" })
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	use({ "mbbill/undotree" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "simrat39/rust-tools.nvim" })
	use({
		"Saecki/crates.nvim",
		config = function()
			require("crates").setup({
				src = { cmp = { enabled = true } },
			})
		end,
	})
	use({
		"Bryley/neoai.nvim",
		cmd = {
			"NeoAI",
			"NeoAIOpen",
			"NeoAIClose",
			"NeoAIToggle",
			"NeoAIContext",
			"NeoAIContextOpen",
			"NeoAIContextClose",
			"NeoAIInject",
			"NeoAIInjectCode",
			"NeoAIInjectContext",
			"NeoAIInjectContextCode",
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("neoai").setup({
				models = {
					{
						name = "openai",
						model = "gpt-3.5-turbo",
						params = nil,
					},
				},
			})
		end,
	})
end)
