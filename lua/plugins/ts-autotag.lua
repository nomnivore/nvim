return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
