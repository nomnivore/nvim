return {
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@param opts ConformOpts
    opts = function(_, opts)
      -- extend the 'prettier' extra to prefer 'prettierd'
      for key, val in pairs(opts.formatters_by_ft) do
        if type(val) == "table" and val[1] == "prettier" then
          opts.formatters_by_ft[key][1] = { "prettierd", "prettier" }
        end
      end

      -- add ft formatters for biome
      local biome_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" }
      for _, ft in ipairs(biome_ft) do
        if opts.formatters_by_ft[ft] == nil then
          opts.formatters_by_ft[ft] = { { "biome" } }
        else
          opts.formatters_by_ft[ft][1] = opts.formatters_by_ft[ft][1] or {}
          table.insert(opts.formatters_by_ft[ft][1], 1, "biome")
        end
      end

      ---@diagnostic disable-next-line: inject-field
      opts.formatters.biome = {
        condition = function(ctx)
          return vim.fn.findfile("biome.json", ctx.dirname .. ";") ~= ""
        end,
      }
    end,
  },
}
