-- mostly-aesthetic ui edits

return {
  {
    "folke/snacks.nvim",
    optional = true,
    opts = {
      dashboard = {
        preset = {
          header = [[
   ███╗   ██╗ ██████╗ ███╗   ███╗███╗   ██╗██╗    ██████╗ ███████╗██╗   ██╗
   ████╗  ██║██╔═══██╗████╗ ████║████╗  ██║██║    ██╔══██╗██╔════╝██║   ██║
   ██╔██╗ ██║██║   ██║██╔████╔██║██╔██╗ ██║██║    ██║  ██║█████╗  ██║   ██║
   ██║╚██╗██║██║   ██║██║╚██╔╝██║██║╚██╗██║██║    ██║  ██║██╔══╝  ╚██╗ ██╔╝
   ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║ ╚████║██║    ██████╔╝███████╗ ╚████╔╝
   ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝    ╚═════╝ ╚══════╝  ╚═══╝
   ]],
        },
      },
    },
  },

  {
    -- visual changes for LSP hover and documentation popups
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
  },
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
