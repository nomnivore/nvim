local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  -- https://github.com/kawre/leetcode.nvim#lazy-loading
  lazy = leet_arg ~= vim.fn.argv()[1],

  build = ":TSUpdate html",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- optional
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    arg = leet_arg,

    ---@type lc.lang
    lang = "typescript",
  },
}
