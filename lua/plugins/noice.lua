return {
  "folke/noice.nvim",
  ---@type NoiceConfig
  opts = {
    lsp = {
      hover = {
        silent = true,
      },
      documentation = {
        ---@type NoiceViewOptions
        opts = {
          border = "single",
          position = { row = 2, col = 1 },
          win_options = {
            winhighlight = {
              -- FloatBorder = "Comment",
              -- Normal = "Normal",
            },
          },
        },
      },
    },
  },
}
