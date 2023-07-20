return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
  },

  config = function(_, opts)
    require("icon-picker").setup(opts)
  end,

  opts = {
    disable_legacy_commands = true,
  },

  keys = {
    {
      "<leader>se",
      "<cmd>IconPickerNormal emoji<CR>",
      desc = "Search Emoji",
    },
  },
}
