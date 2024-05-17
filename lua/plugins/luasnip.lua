return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function() end, -- lazyvim wants to load the snippets right away,  but we'll wait so we can set up the ft_func first
      },
    },

    config = function(opts)
      local ls = require("luasnip")
      ls.setup(opts)

      -- Inherit js snippets in typescript
      ls.filetype_extend("typescript", { "javascript" })
      ls.filetype_extend("typescriptreact", { "javascriptreact" })

      require("luasnip.loaders.from_vscode").lazy_load()
      local folderSep = jit.os:find("Windows") and "\\" or "/"

      -- Load custom snippets from the snippets folder
      -- e.g ~/.config/nvim/snippets
      local custom_snippets = vim.fn.stdpath("config") .. folderSep .. "snippets"

      -- load if it is a valid vscode style snippets folder
      if vim.fn.isdirectory(custom_snippets) == 1 then
        if vim.fn.filereadable(custom_snippets .. folderSep .. "package.json") then
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { custom_snippets } })
        end
      end
    end,

    keys = function()
      -- disable default keymaps and use only these
      return {
        {
          "<leader>cS",
          function()
            require("luasnip.loaders").edit_snippet_files()
          end,
          desc = "Edit Snippets",
        },
        {
          "<C-F>",
          function()
            return require("luasnip").choice_active() and "<Plug>luasnip-next-choice" or "<C-F>"
          end,
          expr = true,
          silent = true,
          mode = { "i", "s" },
        },
        {
          "<C-B>",
          function()
            return require("luasnip").choice_active() and "<Plug>luasnip-prev-choice" or "<C-B>"
          end,
          expr = true,
          silent = true,
          mode = { "i", "s" },
        },
        {
          "<C-L>",
          function()
            local luasnip = require("luasnip")
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              return "<C-L>"
            end
          end,
          expr = true,
          silent = true,
          mode = { "i", "s" },
        },
        {
          "<C-H>",
          function()
            local luasnip = require("luasnip")
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              return "<C-H>"
            end
          end,
          expr = true,
          silent = true,
          mode = { "i", "s" },
        },
      }
    end,
  },
}
