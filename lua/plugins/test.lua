-- TODO: remove virtual text icon (numcolumn icon should do it)

return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },

    opts = function(_, opts)
      opts.adapters["neotest-jest"] = {}
      opts.adapters["neotest-vitest"] = {}
    end,
  },
}
