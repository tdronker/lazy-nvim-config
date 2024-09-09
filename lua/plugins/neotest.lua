local neotest = require("neotest")
local utils = require("utils")

neotest.setup({
	adapters = {
		require("neotest-python")({
			-- TODO: Can be set dynamically. So that running a single test will work, rigth now it always run all tests.
			args = { "src/tests", "-t", "src", "-v" },
			python = ".venv/bin/python3",
		}),
	},
})

utils.map("n", "<leader>tr", "<Cmd>Neotest run<CR>", { noremap = true, silent = true })
utils.map("n", "<leader>ts", "<Cmd>lua require('neotest').summary.toggle()<CR>", { noremap = true, silent = true })
utils.map("n", "<leader>to", "<Cmd>lua require('neotest').output_panel.toggle()<CR>", { noremap = true, silent = true })
utils.map(
	"n",
	"<leader>tn",
	"<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>",
	{ noremap = true, silent = true }
)
utils.map(
	"n",
	"<leader>tp",
	"<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>",
	{ noremap = true, silent = true }
)
