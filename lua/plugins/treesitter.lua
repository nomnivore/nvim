return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufRead", "BufNewFile" },

    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 5,
        -- explicitly setting min prevents errors for whatever reason
        min_window_height = 20,
      })
    end,
  },
}
