return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod" },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
      { "jsborjesson/vim-uppercase-sql", lazy = true, ft = { "sql", "mysql", "plsql" } },
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
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
      vim.g.db_ui_execute_on_save = false
      vim.g.db_ui_use_nvim_notify = true

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          ---@diagnostic disable-next-line: missing-fields
          require("cmp").setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
            },
          })
        end,
      })
    end,
  },

  {
    "folke/edgy.nvim",
    optional = true,

    opts = function(_, opts)
      table.insert(opts.right, {
        title = "Database",
        ft = "dbui",
        pinned = true,
        open = function()
          vim.cmd("DBUI")
        end,
      })

      table.insert(opts.bottom, {
        title = "DB Query Result",
        ft = "dbout",
      })
    end,
  },
}
