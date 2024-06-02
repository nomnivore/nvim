return {
  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      no_italic = true,
    },
  },

  -- add additional themes
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    event = "VeryLazy",
    opts = {
      style = "darker",
    },
  },
  { "lunarvim/horizon.nvim", name = "horizon", event = "VeryLazy" },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    event = "VeryLazy",
    opts = {
      keywordStyle = { italic = false },
    },
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
