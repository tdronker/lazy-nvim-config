vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Standard Neovim/Vim Settings
map("n", "<leader>v", ":vs<CR><C-w>l")
map("n", "<leader>s", ":split<CR><C-w>j")
map("n", "+", ":vertical resize +5<CR>")
map("n", "-", ":vertical resize -5<CR>")
map("n", "<M-+>", ":resize +5<CR>")
map("n", "<M-->", ":resize -5<CR>")
map("n", "X", ":bd!<CR>")

-- Plugin: NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Plugin: Telescope
map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")

-- Plugin: Formatter
map("n", "<leader>f", ":Format<CR>")

-- Plugin: BufferLine
map("n", "<Tab>", ":BufferNext<CR>")
map("n", "<S-Tab>", ":BufferPrevious<CR>")
map("n", "mp", ":BufferMovePrevious<CR>")
map("n", "mn", ":BufferMoveNext<CR>")

-- Plugin: Lspsaga
map("n", "gd", ":Lspsaga goto_type_definition<CR>")
map("n", "gi", ":Lspsaga finder<CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "rn", ":Lspsaga rename<CR>")
map("n", "å", ":Lspsaga code_action<CR>")
map("n", "ö", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "ä", ":Lspsaga diagnostic_jump_next<CR>")

-- Plugin: Trouble
map("n", "<leader>xx", ":TroubleToggle<CR>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>")

-- Plugin: UndoTree
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- Plugin: Bookmark
map("n", "[", ":BookmarkNext<CR>")
map("n", "]", ":BookmarkPrev<CR>")

-- Plugin: NeoAI
map("n", "<leader>ai", ":NeoAI<CR>")
map("v", "<leader>aic", ":NeoAIContext<CR>")

-- Plugin: MiniMap
map("n", "<Leader>mc", ":lua MiniMap.close()<CR>")
map("n", "<Leader>mf", ":lua MiniMap.toggle_focus()<CR>")
map("n", "<Leader>mo", ":lua MiniMap.open()<CR>")
map("n", "<Leader>mr", ":lua MiniMap.refresh()<CR>")
map("n", "<Leader>ms", ":lua MiniMap.toggle_side()<CR>")
map("n", "<Leader>mt", ":lua MiniMap.toggle()<CR>")
