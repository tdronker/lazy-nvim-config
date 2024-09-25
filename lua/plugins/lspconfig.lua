-- Setup Mason and Mason LSPConfig
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "bashls", "eslint", "html", "typos_lsp" },
})

require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,

	["textlsp"] = function()
		require("lspconfig").textlsp.setup({})
	end,
})
