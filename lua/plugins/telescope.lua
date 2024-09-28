local utils = require("utils")

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").close,
			},
			n = {
				["q"] = require("telescope.actions").close,
			},
		},
	},
})

require("telescope").load_extension("ui-select")

utils.map("n", "<C-p>", ":Telescope find_files<CR>")
utils.map("n", "<C-f>", ":Telescope live_grep<CR>")
utils.map("n", "<leader>l", ":Telescope lsp_document_symbols<CR>")
