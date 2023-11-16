local cmp = require("cmp")
local lspkind = require("lspkind")

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
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true, -- Show the text along with the icon
			maxwidth = 50, -- Prevent the popup from being too wide
			-- Define custom icons here if you want
			before = function(entry, vim_item)
				-- This sets a default icon for all items
				vim_item.kind = string.format("%s", lspkind.presets.default[vim_item.kind])
				-- ... additional modifications to vim_item can be made here ...
				return vim_item
			end,
		}),
	},
})
