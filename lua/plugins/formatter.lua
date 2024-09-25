-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
			require("formatter.filetypes.typescript").eslint_d,
		},

		typescriptreact = {
			require("formatter.filetypes.typescript").prettier,
			require("formatter.filetypes.typescript").eslint_d,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
			require("formatter.filetypes.javascript").eslint_d,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
			require("formatter.filetypes.javascriptreact").eslint_d,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
