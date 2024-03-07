return {
  -- using the lazyvim.extra for markdown

  -- ISSUE: headlines cuases visual issues with tmux
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   enabled = false,
  -- },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    keys = {
      {
        "<leader>cG",
        "<cmd>Glow<cr>",
        desc = "Glow (preview)",
        ft = { "markdown" },
      },
    },
    opts = {
      install_path = "~/.asdf/shims/glow",
      width_ratio = 0.9,
      height_ratio = 0.9,
      border = "rounded",
    },
  },
}
