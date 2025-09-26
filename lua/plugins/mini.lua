-- plugins from the 'mini' suite
return {
  {
    "nvim-mini/mini.splitjoin",
    name = "mini.splitjoin",
    version = false,
    event = "LazyFile",

    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,
  },
  {
    "nvim-mini/mini.hipatterns",
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
