---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      tailwindcss = {
        settings = {
          tailwindCSS = {
            emmetCompletions = true,
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              },
            },
          },
        },
      },
      astro = {},
      cssls = {},
      biome = {
        root_dir = function(fname)
          local root_file = {
            "biome.json",
          }
          root_file = require("lspconfig.util").insert_package_json(root_file, "@biomejs/biome", fname)

          return require("lspconfig.util").root_pattern(unpack(root_file))(fname)
        end,

        -- ideally i don't want to disable this
        -- but it basically negates the root_dir specificity
        single_file_support = false,
      },
      slint_lsp = {
        root_dir = function(fname)
          local root_file = {
            "Cargo.toml",
            "package.json",
          }

          -- return roo_pattern of root_file OR git ancestor
          return require("lspconfig.util").root_pattern(unpack(root_file))(fname)
            or require("lspconfig.util").find_git_ancestor(fname)
        end,
      },
    },
  },
}
