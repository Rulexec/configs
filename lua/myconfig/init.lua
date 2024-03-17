local M = {}

function M.init()
	local config_path = vim.fn.stdpath("config")

	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		{ "ckipp01/stylua-nvim" },
		{
			"tanvirtin/monokai.nvim",
			config = function()
				local monokai = require("monokai")
				monokai.setup({ palette = monokai.pro })

				vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffcccc", bold = false })
				vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#cef6c4", bold = false })
				vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "gray", bold = false })
			end,
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup({ view = { relativenumber = true } })
			end,
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("telescope").setup({
					pickers = {
						find_files = {
							hidden = true,
						},
					},
				})
			end,
		},
	})

	require("myconfig.keymap")
	require("myconfig.lsp")

	vim.wo.relativenumber = true
	vim.o.guifont = "SauceCodePro Nerd Font Mono"
end

return M