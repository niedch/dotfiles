return {
	{
		"rest-nvim/rest.nvim",
    ft = "http",
		config = function()
			require("rest-nvim").setup()
			vim.keymap.set("n", "<leader>mh", "<cmd>Rest run<cr>", {})
			vim.keymap.set("n", "<leader>mi", "<cmd>Rest open<cr>", {})
		end,
	},
}
