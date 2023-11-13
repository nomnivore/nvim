return {
  {
    -- "lua/ollama", -- for local dev
    "nomnivore/ollama.nvim", -- for release
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>om",
        "<cmd>OllamaModel<cr>",
        desc = "Ollama Model",
      },
    },

    config = function(_, opts)
      require("ollama").setup(opts)
      local config = require("ollama").config

      if not config then
        return
      end

      for _, val in pairs(config.prompts) do
        if val and val.action == "replace" then
          val.action = "display_replace"
        elseif val and val.action == "insert" then
          val.action = "display_insert"
        end
      end
    end,

    ---@type Ollama.Config
    opts = {
      prompts = {
        -- Raw = false,
        -- Ask_About_Code = false,
        ---@diagnostic disable-next-line: missing-fields
        Modify_Code = {
          action = "display_replace",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>o"] = { name = "+ollama" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,

    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          local status = require("ollama").status()

          if status == "IDLE" then
            return "󱙺" -- nf-md-robot-outline
          elseif status == "WORKING" then
            return "󰚩" -- nf-md-robot
          end
        end,
        cond = function()
          return package.loaded["ollama"] and require("ollama").status() ~= nil
        end,
      })
    end,
  },
}
