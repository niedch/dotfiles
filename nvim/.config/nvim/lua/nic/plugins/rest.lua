return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>mh", function() require("kulala").run() end, desc = "Send request", mode = {"n", "v"} },
      { "<leader>mH", function() require("kulala").run_all() end, desc = "Send all requests", mode = {"n", "v"} },
    },
    ft = {"http", "rest"},
    opts = {
      global_keymaps = true,
      kulala_keymaps = {
        ["Show verbose"] = { "gV", function() require("kulala.ui").show_verbose() end },
      },
      ui = {
        win_opts = {
          wo = {
            foldenable = false,
            foldmethod = "manual",
          },
        },
      },
    },
  },
}
