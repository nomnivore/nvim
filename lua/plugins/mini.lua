return {
  {
    "echasnovski/mini.splitjoin",
    name = "mini.splitjoin",
    version = false,

    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,

    keys = {
      {
        "gS",
        function()
          require("mini.splitjoin").toggle()
        end,
        mode = { "n", "v" },
        desc = "Split/Join Arguments",
      },
    },
  },
}
