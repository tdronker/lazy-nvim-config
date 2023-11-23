---@diagnostic disable: redundant-parameter
local cmp = require("cmp")
local lspkind = require("lspkind")

lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup({
	snippet = {
		-- REQUIRED for `nvim-cmp` snippet support
		expand = function(args)
			-- For `LuaSnip` users
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		-- Your key mappings for the completion menu
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "crates" },
	}),
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			with_text = false, -- Show the text along with the icon
			maxwidth = 75, -- Prevent the popup from being too wide
		}),
	},
	window = {
		-- Completion
		completion = {
			border = "rounded", -- You can use 'single', 'double', 'shadow', 'rounded' or 'none'
		},
		-- Documentation
		documentation = {
			border = "rounded", -- You can use 'single', 'double', 'shadow', 'rounded' or 'none'
		},
	},
})
