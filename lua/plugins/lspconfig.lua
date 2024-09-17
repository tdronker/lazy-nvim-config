-- Setup Mason and Mason LSPConfig
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "bashls", "eslint" },
})

-- Setup handlers for Mason LSPConfig
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

-- Import necessary modules
local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- List of language servers to setup
local servers = {
	"lua_ls",
	"ts_ls",
	"bashls",
	"pyright",
}

-- Setup each language server with capabilities
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
end

-- Setup ESLint separately
nvim_lsp.eslint.setup({})

-- Add vim as a global for lua_ls
nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "bashls", "eslint" },
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup language servers
local servers = {
	"lua_ls",
	"ts_ls",
	"bashls",
	"pyright",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
end

nvim_lsp.eslint.setup({})

-- Add vim as a global for lua_ls
nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
