-- Ensure lazy.nvim is loaded
vim.cmd([[packadd lazy.nvim]])

-- Setup lazy.nvim
require("lazy").setup({
	-- Avante AI
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},

		config = function()
			require("plugins.avante")
		end,
	},

	-- Coding
	{
		"m4xshen/hardtime.nvim",
		event = "BufRead",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("hardtime").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	-- CopilotChat: Provides GitHub Copilot integration for chat-like coding assistance
	{
		"CopilotC-Nvim/CopilotChat.nvim",

		branch = "canary",
		event = "BufWinEnter",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			debug = false,
		},
		config = function()
			require("plugins.copilot")
		end,
	},
	-- Nvim-cmp: Autocompletion plugin for Neovim
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"zbirenbaum/copilot-cmp",
			"onsails/lspkind-nvim",
			"rafamadriz/friendly-snippets",
		},
		build = "make install_jsregexp",
		config = function()
			require("plugins.cmp")
		end,
	},
	-- LSPconfig: Configuration support for Language Server Protocols
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("plugins.lspconfig")
		end,
	},
	-- Formatter: Provides code formatting capabilities
	{
		"mhartington/formatter.nvim",
		event = "BufWritePre",
		config = function()
			require("plugins.formatter")
		end,
	},
	-- Vim-surround: Provides surround text editing capabilities
	{
		"tpope/vim-surround",
	},
	-- Nvim-comment: Easy commenting of code blocks
	{
		"terrortylor/nvim-comment",
		event = "BufRead",
		config = function()
			require("plugins.comment")
		end,
	},
	-- Indent-blankline: Adds indentation guides to Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("ibl").setup()
		end,
	},
	-- Neotest: Extensible testing framework for Neovim
	{
		"nvim-neotest/neotest",
		event = "BufRead",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("plugins.neotest")
		end,
	},
	-- Navigation
	-- Bookmarks: Provides bookmarking functionality
	{
		"tomasky/bookmarks.nvim",
		event = "BufRead",
		config = function()
			require("plugins.bookmarks")
		end,
	},
	-- Telescope: Fuzzy finder over lists
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	-- Nvim-tree: File explorer tree for Neovim
	{
		"kyazdani42/nvim-tree.lua",
		event = "BufWinEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.nvim-tree")
		end,
	},
	-- Barbar: Tabline plugin that handles multiple buffers
	{
		"romgrk/barbar.nvim",
		event = "BufWinEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.barbar")
		end,
	},
	-- Lualine: A blazing fast and easy to configure Neovim statusline
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		prio = 999,
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	},
	-- Nvim-tmux-navigation: Seamless navigation between tmux panes and Neovim splits
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	-- Vim-fugitive: A Git wrapper so awesome, it should be illegal
	{
		"tpope/vim-fugitive",
		event = "BufRead",
	},

	-- Theme
	-- Gruvbox-material: A modified Gruvbox theme with material palette
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_palette = "mix"
			vim.cmd([[colorscheme gruvbox-material]])
		end,
	},
})
