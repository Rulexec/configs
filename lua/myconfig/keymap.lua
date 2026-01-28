local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap leader key
map("n", ",", "<nop>")
vim.g.mapleader = ","

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Paste from OS buffer in insert mode
map("i", "<C-S-v>", "<C-r>+")

require("which-key").add({
	-- Telescope group
	{ "<leader>t", group = "Telescope" },
	{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>tf", "<cmd>Telescope fd<cr>", desc = "Files" },
	{ "<leader>tF", "<cmd>Telescope find_files<cr>", desc = "Find files (incl. hidden)" },
	{ "<leader>td", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP definitions" },
	{ "<leader>tr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },

	-- NvimTree group
	{ "<leader>T", group = "NvimTree" },
	{ "<leader>Tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle" },
	{ "<leader>Tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find file" },
	{ "<leader>Tc", "<cmd>lua require('nvim-tree.api').fs.create()<cr>", desc = "Create file" },

	-- LSP group
	{ "<leader>l", group = "LSP" },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", desc = "Format" },
	{ "<leader>lc", vim.lsp.buf.code_action, desc = "Code action" },

	-- LSP Diagnostics subgroup
	{ "<leader>ld", group = "Diagnostics" },
	{ "<leader>ldo", vim.diagnostic.open_float, desc = "Open float" },
	{ "<leader>ld[", vim.diagnostic.goto_prev, desc = "Go to prev" },
	{ "<leader>ld]", vim.diagnostic.goto_next, desc = "Go to next" },

	-- Rarely used group
	{ "<leader>\\", group = "rarely used" },
	{ "<leader>\\f", group = "format" },
	{ "<leader>\\fl", "<cmd>lua require('stylua-nvim').format_file()<cr>", desc = "Format Lua" },
	{ "<leader>\\w", "<cmd>WhichKey<cr>", desc = "WhichKey" },

	-- Top-level mappings
	{ "K", vim.lsp.buf.hover, desc = "LSP hover [MY]" },
	{ "[d", vim.diagnostic.goto_prev, desc = "Prev LSP diagnostic [MY]" },
	{ "]d", vim.diagnostic.goto_next, desc = "Next LSP diagnostic [MY]" },
})
