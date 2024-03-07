return {
  {
    "lua/ollama", -- for local dev
    -- "nomnivore/ollama.nvim", -- for release
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
      {
        -- testing chat
        "<leader>oc",
        "<cmd>OllamaChat<cr>",
        desc = "OllamaChat",
      },
      {
        "<leader>oC",
        function()
          require("ollama.chat").close()
        end,
        desc = "OllamaChat Close",
      },
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "Ollama Prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>om",
        "<cmd>OllamaModel<cr>",
        desc = "Ollama Model",
      },
      {
        "<leader>os",
        "<cmd>OllamaServe<cr>",
        desc = "Ollama Serve",
      },
      {
        "<leader>oS",
        "<cmd>OllamaServeStop<cr>",
        desc = "Ollama Serve Stop",
      },
      {
        "<leader>oM",
        ":Ollama Modify_Code<cr>",
        desc = "Modify Code",
        mode = { "n", "v" },
      },
      {
        "<leader>oG",
        ":lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "Generate Code",
      },
      {
        "<leader>oq",
        function()
          require("ollama").cancel_all_jobs()
        end,
        desc = "Cancel All Jobs",
      },
    },

    config = function(_, opts)
      require("ollama").setup(opts)
      local config = require("ollama").config

      if not config then
        return
      end

      local stream_all = true

      if stream_all then
        for _, val in pairs(config.prompts) do
          if val and val.action == "replace" then
            val.action = "display_replace"
          elseif val and val.action == "insert" then
            val.action = "display_insert"
          end
        end
      end

      local win_type = "float"

      for _, val in pairs(config.prompts) do
        if val and val.action == "display" then
          val.action =
            require("ollama.actions.factory").create_action({ display = true, show_prompt = true, window = win_type })
        elseif val and val.action == "display_replace" then
          val.action = require("ollama.actions.factory").create_action({
            display = true,
            show_prompt = true,
            window = win_type,
            replace = true,
          })
        elseif val and val.action == "display_insert" then
          val.action = require("ollama.actions.factory").create_action({
            display = true,
            show_prompt = true,
            window = win_type,
            insert = true,
          })
        end
      end
    end,

    ---@type Ollama.Config
    opts = {
      -- docker run -d --rm --gpus=all -v <volume>:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
      model = "codellama:latest",
      serve = {
        command = "docker",
        args = {
          "run",
          "-d",
          "--rm",
          "--gpus=all",
          "-v",
          "ollama:/root/.ollama",
          "-p",
          "11434:11434",
          "--name",
          "ollama",
          "ollama/ollama",
        },
        stop_command = "docker",
        stop_args = { "stop", "ollama" },
      },
      ---@type Ollama.Prompt[]
      prompts = {
        -- prompts for testing functionality
        ---@type Ollama.Prompt
        Test_Stream = {
          prompt = "Write me an interesting story about a programmer who couldn't fix their software's bugs.",
          action = "display",
          options = {
            seed = 123456,
          },
        },

        Json_Api = {
          prompt = "$input",
          system = "You are a RESTful API. The user is sending a request to you, and you must respond with a JSON object.",
          format = "json",
        },
        ---@type Ollama.Prompt
        Ask_About_Code = {
          action = "display",
        },

        ---@type Ollama.Prompt
        Generate_Code_At_Line = {
          system = [[ You are a pair programming AI assistant. The human has written a file, and needs you to write a snippet code for a specific task or purpose.
          Your code will be inserted at the line number specified.
          Respond only with the code you would write, not the entire file. Do not include extra explanations, and do not repeat the code the human has already written.
          ]],
          prompt = "Here is what I need: $input\n Here is the code I have written so far:\n```$ftype\n$buf\n```\nYour code will be inserted at line $lnum. Please format your response like this: \n```$ftype\n<your code here>\n```\n",
          action = "display_insert",
        },

        Repeat_Word = {
          prompt = "Repeat this word back to me: $sel",
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
