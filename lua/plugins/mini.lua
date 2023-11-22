return {
  {
    "echasnovski/mini.splitjoin",
    name = "mini.splitjoin",
    version = false,
    event = "LazyFile",

    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,

    -- keys = {
    --   {
    --     "gS",
    --     function()
    --       require("mini.splitjoin").toggle()
    --     end,
    --     mode = { "n", "v" },
    --     desc = "Toggle Arguments",
    --   },
    -- },
  },
  {
    "echasnovski/mini.hipatterns",
    version = false,
    optional = true,
    keys = {
      {
        "<leader>cC",
        function()
          require("mini.hipatterns").toggle()
        end,
        desc = "Colorizer Toggle (MiniHi)",
      },
    },
  },
}
