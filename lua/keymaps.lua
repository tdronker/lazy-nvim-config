vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- plugin keymaps
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>f", ":Format<CR>")
map("n", "<Tab>", ":BufferNext<CR>")
map("n", "<S-Tab>", ":BufferPrevious<CR>")

map("n", "<silent>å", ":lua vim.lsp.buf.code_action()")
-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gd", ":Lspsaga goto_definition<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- Go to references
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- Show hover documentation
-- map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")
-- Show signature help
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- Rename
-- map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "rn", ":Lspsaga rename<CR>")
-- Code action
-- map("n", "å", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "å", ":Lspsaga code_action<CR>")

-- Diagnostics
-- map("n", "ö", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- map("n", "ä", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "ö", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "ä", ":Lspsaga diagnostic_jump_next<CR>")

-- Lua
map("n", "<leader>xx", ":TroubleToggle<CR>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>")
map("n", "<leader>ca", ":TroubleToggle quickfix<CR>")
map("n", "<leader>xl", ":TroubleToggle loclist<CR>")
map("n", "<leader>gR", ":TroubleToggle lsp_references<CR>")
