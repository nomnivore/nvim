return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        tailwind = true,
        css = true,
        always_update = true,
      },
    })
  end,
  keys = {
    { "<leader>cC", ":ColorizerToggle<CR>", desc = "Colorizer Toggle" },
  },
}
