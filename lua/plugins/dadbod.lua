return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },

    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    keys = {
      {
        "<leader>cD",
        "<cmd>DBUI<CR>",
        desc = "Dadbod UI",
      },
    },

    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "folke/edgy.nvim",

    opts = function(_, opts)
      table.insert(opts.left, {
        title = "Database",
        ft = "dbui",
      })
    end,
  },
}
