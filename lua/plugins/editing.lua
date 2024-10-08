-- small tweaks to the editing experience
-- that don't need their own file

return {
  {
    -- smooth remapping for leaving insert mode
    -- doesn't slow down typing
    "max397574/better-escape.nvim",
    event = "InsertEnter",

    opts = {
      default_mappings = true,
    },
  },
  {
    -- better automatic indentation detection
    "Darazaki/indent-o-matic",
  },
  {
    -- searchable icons/emoji
    "ziontee113/icon-picker.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },

    config = function(_, opts)
      require("icon-picker").setup(opts)
    end,

    opts = {
      disable_legacy_commands = true,
    },

    keys = {
      {
        "<leader>se",
        "<cmd>IconPickerNormal<CR>",
        desc = "Search Icons",
      },
    },
  },
  {
    -- generate annotation/doc-style comments per language
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    event = "BufReadPre",

    config = function()
      require("neogen").setup({
        enabled = true,
        snippet_engine = "luasnip",
      })
    end,

    keys = {
      {
        "<leader>cg",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate annotation comments",
      },
    },
  },

  -- auto save
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },

    opts = {
      enabled = true,
      -- necessary to not conflict with auto formatting
      noautocmd = true,
      debounce_delay = 2000, -- ms

      execution_message = {
        enabled = false,
        -- if the functionality is good, maybe integrate it with lualine?
      },
    },
  },
}
