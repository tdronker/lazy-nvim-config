local utils = require("utils")
local copilotchat = require("CopilotChat")

-- Setup CopilotChat
copilotchat.setup({
	mappings = {
		complete = {
			insert = "",
		},
	},
	auto_insert_mode = true,
})

-- Key mappings for CopilotChat
utils.map("n", "<C-c>", ":CopilotChat<CR>", { noremap = true, silent = true })
utils.map("v", "<C-c>", ":CopilotChat<CR>", { noremap = true, silent = true })
utils.map("n", "<leader>cc", ":CopilotChatCommitStaged<CR>", { noremap = true, silent = true })

-- Function for quick chat input
function CopilotBufferChat()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		copilotchat.ask(input, { selection = require("CopilotChat.select").buffer })
	end
end

-- Key mapping for quick chat
utils.map("n", "<leader>ccq", ":lua CopilotBufferChat()<CR>", { noremap = true, silent = true })

-- Setup Copilot
require("copilot").setup({
	suggestion = { enabled = false },
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	panel = {
		enabled = false,
	},
})
