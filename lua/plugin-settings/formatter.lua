---@diagnostic disable: undefined-field
require("formatter").setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						vim.api.nvim_buf_get_name(0),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		typescript = {
			require("formatter.filetypes.typescript").eslint_d,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").eslint_d,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
	},
})
