return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
        },
      })

      -- if telescope is installed, register its extension
      if pcall(require, "telescope") then
        require("telescope").load_extension("harpoon")
      end
    end,

    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add File",
      },
      {
        "<leader>hd",
        function()
          require("harpoon.mark").rm_file()
        end,
        desc = "Remove File",
      },
      {
        "<leader>hq",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Quick Menu",
      },
      {
        "<leader>hs",
        "<Cmd>Telescope harpoon marks<CR>",
        desc = "Search Marks",
      },
      {
        "<leader>hl",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Next Mark",
      },
      {
        "<leader>hh",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Prev Mark",
      },
      {
        "<leader>hD",
        function()
          require("harpoon.mark").clear_all()
        end,
        desc = "Clear All Marks",
      },
      -- idea: main file (1), secondary file (2), harpoon terminal (3). <leader>h1 <leader>h2 <leader>h3
      {
        "<leader>h1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Nav File 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Nav File 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon.term").gotoTerminal(1)
        end,
        desc = "Nav Terminal 1",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    ---@type bufferline.Config
    opts = {
      options = {
        numbers = function(number_opts)
          local harpoon = require("harpoon.mark")
          local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
          local harpoon_mark = harpoon.get_index_of(buf_name)
          -- return harpoon_mark as string
          return harpoon_mark and tostring(harpoon_mark) .. " 󰛢" or ""
        end,
      },
    },
  },
}
