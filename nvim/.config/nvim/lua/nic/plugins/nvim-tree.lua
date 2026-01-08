return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignore = true,
          hide_by_name = {
            ".git",
            ".gitignore",
            "node_modules",
            ".obsidian",
            ".gitkeep"

          },
        }
      }
    });
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<leader>bs", ":Neotree git_status reveal float<CR>", {})
	end,
	opts = {
		auto_clean_after_session_restore = false,
	},
}
