-- Ensure lazy.nvim is loaded
vim.cmd([[packadd lazy.nvim]])

-- Setup lazy.nvim
require('lazy').setup({
  -- Coding
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      debug = false,
    },
    config = function()
      require('plugins.copilot')
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'zbirenbaum/copilot-cmp'
    },
    config = function()
      require('plugins.cmp')
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('plugins.lspconfig')
    end
  },
  {
    'nvimdev/guard.nvim',
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      require("plugins.guard")
    end
  },
  {
    'tpope/vim-surround',
  },

  -- Navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('plugins.telescope')
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.nvim-tree')
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.barbar')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy         = false,
    prio         = 999,
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config       = function()
      require('plugins.lualine')
    end
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  },
  {
    'tpope/vim-fugitive',
    event = 'BufWinEnter'
  },

  -- Theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end
  }
})
