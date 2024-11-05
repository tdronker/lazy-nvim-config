-- Require the 'avante' module and set it up with the following configuration
require("avante").setup({
	---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
	provider = "azure", -- Recommend using Claude
	auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
	-- claude = {
	--   endpoint = "https://api.anthropic.com",
	--   model = "claude-3-5-sonnet-20240620",
	--   temperature = 0,
	--   max_tokens = 4096,
	-- },
	azure = {
		endpoint = "https://sabina-openai.openai.azure.com/", -- example: "https://<your-resource-name>.openai.azure.com"
		deployment = "gpt-4", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
		api_version = "2023-03-15-preview",
		timeout = 60000, -- Timeout in milliseconds
		temperature = 0,
		max_tokens = 4096,
		["local"] = false,
	},
	behaviour = {
		auto_suggestions = false, -- Experimental stage
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = false,
	},
	mappings = {
		--- @class AvanteConflictMappings
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "<M-ä>",
			prev = "<M-ö>",
		},
		suggestion = {
			accept = "<M-l>",
			next = "<M-ä>",
			prev = "<M-ö>",
			dismiss = "<C-x>",
		},
		jump = {
			next = "ä",
			prev = "ö",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		sidebar = {
			switch_windows = "<Tab>",
			reverse_switch_windows = "<S-Tab>",
			close = "<Esc>",
		},
	},
	hints = { enabled = false },
	windows = {
		---@type "right" | "left" | "top" | "bottom"
		position = "right", -- the position of the sidebar
		wrap = true, -- similar to vim.o.wrap
		width = 40, -- default % based on available width
		relativenumber = true,
		border = "single", -- Add this line to specify the border type
		sidebar_header = {
			align = "right", -- left, center, right for title
			rounded = false,
		},
	},
	highlights = {
		diff = {
			current = "DiffText",
			incoming = "DiffAdd",
		},
	},
	--- @class AvanteConflictUserConfig
	diff = {
		autojump = true,
		---@type string | fun(): any
		list_opener = "copen",
	},
})
