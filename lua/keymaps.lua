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
map("n", "mp", ":BufferMovePrevious<CR>")
map("n", "mn", ":BufferMoveNext<CR>")

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
-- Rename
-- map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "rn", ":Lspsaga rename<CR>")
-- Code action
-- map("n", "å", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "å", ":Lspsaga code_action<CR>")
map("n", "<leader>v", ":vs<CR><C-w>l")
map("n", "<leader>s", ":split<CR><C-w>j")

-- Diagnostics
-- map("n", "ö", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- map("n", "ä", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "ö", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "ä", ":Lspsaga diagnostic_jump_next<CR>")

-- Lua
map("n", "<leader>xx", ":TroubleToggle<CR>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- Resize windows
map("n", "+", ":vertical resize +5<CR>")
map("n", "-", ":vertical resize -5<CR>")
map("n", "<M-+>", ":resize +5<CR>")
map("n", "<M-->", ":resize -5<CR>")

map("n", "[", ":BookmarkNext<CR>")
map("n", "]", ":BookmarkPrev<CR>")
-- Easy Motion
-- Map <Leader>f for the EasyMotion overwin-finder
map("n", "<leader>ai", ":NeoAI<CR>")
map("v", "<leader>aic", ":NeoAIContext<CR>")
