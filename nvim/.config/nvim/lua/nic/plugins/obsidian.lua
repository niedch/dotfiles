return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			ui = {
				enable = true,
			},
			completion = {
				nvim_cmp = false,
			},
			workspaces = {
				{
					name = "vault",
					path = "~/projects/vault",
				},
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M:%S",
			},
		})

		local cmp = require("cmp")
		cmp.register_source("obsidian", require("cmp_obsidian").new())
		cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
		cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
	end,
}
