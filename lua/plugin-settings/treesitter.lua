---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "query", "c", "typescript", "rust", "jsonc", "markdown", "markdown_inline" },
	highlight = { enable = true },
})
