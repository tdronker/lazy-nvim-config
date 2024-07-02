_G.vim = vim

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "tsserver", "bashls", "pyright" },
    automatic_installation = true,
})
require('mason-lspconfig').setup_handlers({
    function (server_name)
        require('lspconfig')[server_name].setup {}
    end,
})

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup language servers
local servers = { "lua_ls", "tsserver", "bashls", "pyright" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
    }
end
