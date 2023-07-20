-- TODO: remove virtual text icon (numcolumn icon should do it)

return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },

    opts = function(_, opts)
      opts.adapters["neotest-jest"] = {}
      opts.adapters["neotest-vitest"] = {}

      -- opts.icons = {
      --   expanded = "",
      --   child_prefix = "",
      --   child_indent = "",
      --   final_child_prefix = "",
      --   non_collapsible = "",
      --   collapsed = "",
      --
      --   passed = "",
      --   running = "",
      --   failed = "",
      --   unknown = "",
      -- }
    end,
  },
}
