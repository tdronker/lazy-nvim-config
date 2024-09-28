local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("copilot_cmp").setup()
require("CopilotChat.integrations.cmp").setup()

cmp.setup({
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
		keyword_length = 1,
		native_menu = false,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			cmp.config.compare.exact,
			require("copilot_cmp.comparators").prioritize,
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "copilot", priority_weight = 2 },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 120, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- can also be a function to dynamically calculate max width such as
			-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = false, -- show labelDetails in menu. Disabled by default
			symbol_map = { Copilot = "" },

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end,
		},
		["<S-Tab>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					cmp.complete()
				end
			end,
		},
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end,
		},
		["<S-Tab>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					cmp.complete()
				end
			end,
		},
	}),
})
