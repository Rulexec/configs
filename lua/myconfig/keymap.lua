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

require("which-key").register({
	["<leader>t"] = {
		name = "Telescope",
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		f = { "<cmd>Telescope fd<cr>", "Files" },
		F = { "<cmd>Telescope find_files<cr>", "Find files (incl. hidden)" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "LSP definitions" },
		r = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
		b = { "<cmd>Telescope buffers<cr>", "LSP buffers" },
	},
	["<leader>T"] = {
		name = "NvimTree",
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
		f = { "<cmd>NvimTreeFindFile<cr>", "Find file" },
		c = { "<cmd>lua require('nvim-tree.api').fs.create()<cr>", "Create file" },
	},
	["<leader>l"] = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		c = { vim.lsp.buf.code_action, "Code action" },
		d = {
			name = "Diagnostics",
			o = { vim.diagnostic.open_float, "Open float" },
			["["] = { vim.diagnostic.goto_prev, "Go to prev" },
			["]"] = { vim.diagnostic.goto_next, "Go to next" },
		},
	},
	["<leader>\\"] = {
		name = "rarely used",
		f = {
			name = "format",
			l = { "<cmd>lua require('stylua-nvim').format_file()<cr>", "Format Lua" },
		},
		w = { "<cmd>WhichKey<cr>", "WhichKey" },
	},

	K = { vim.lsp.buf.hover, "LSP hover [MY]" },
	["["] = { d = { vim.diagnostic.goto_prev, "Prev LSP diagnostic [MY]" } },
	["]"] = { d = { vim.diagnostic.goto_next, "Next LSP diagnostic [MY]" } },
})
