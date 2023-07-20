return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
    keys = {
      { "<leader>uz", ":ZenMode<CR>", desc = "Zen Mode" },
    },
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup()
    end,
    keys = {
      { "<leader>ut", ":Twilight<CR>", desc = "Toggle Twilight" },
    },
  },
}
