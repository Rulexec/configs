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
	t = {
		name = "Telescope",
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		f = { "<cmd>Telescope fd<cr>", "Files" },
		F = { "<cmd>Telescope find_files<cr>", "Find files (incl. hidden)" },
	},
	T = {
		name = "NvimTree",
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
		f = { "<cmd>NvimTreeFindFile<cr>", "Find file" },
	},
	p = {
		name = "rarely used",
		f = {
			name = "format",
			l = { "<cmd>lua require('stylua-nvim').format_file()<cr>", "Format Lua" },
		},
		w = { "<cmd>WhichKey<cr>", "WhichKey" },
	},
}, { prefix = "<leader>" })
