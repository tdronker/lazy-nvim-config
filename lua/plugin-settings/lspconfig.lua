local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
mason.setup({})

-- Automatically install LSP servers
mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "tsserver", "rust_analyzer" },
	automatic_installation = true,
})

-- Lua (specifically for Neovim) LSP setup
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = function(client)
		-- (Optional) Disable formatting if you prefer to use another formatter
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

lspconfig.eslint.setup({
	filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
})

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			-- Example setting
			cargo = { allFeatures = true },
		},
	},
})
