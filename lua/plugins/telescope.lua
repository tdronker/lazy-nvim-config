local utils = require("utils")

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
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
