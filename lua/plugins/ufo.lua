if true then
  return {}
end -- temporary disable

local foldIcon = ""
local hlgroup = "NonText"

local function foldTextFormatter(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = "  " .. foldIcon .. "  " .. tostring(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, hlgroup })
  return newVirtText
end

return {
  -- add folding range to capabilities
  {
    "neovim/nvim-lspconfig",
    opts = {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    },
  },

  -- add nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(_, ft, _)
        local lspWithoutFolding = { "markdown", "bash", "sh", "zsh", "css" }
        if vim.tbl_contains(lspWithoutFolding, ft) then
          return { "treesitter", "indent" }
        else
          return { "lsp", "indent" }
        end
      end,

      -- upon opening buffer, close these fold kinds
      -- `:UfoInspect` to get available fold kinds from LSP
      -- close_fold_kinds = { "imports" },
      open_fold_h1_timeout = 500,
      fold_virt_text_handler = foldTextFormatter,
    },

    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
      -- FIXME: this is not working v
      {
        "K",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          vim.api.nvim_notify(tostring(winid), 3, { title = "winid" })
          if not winid then
            -- perform default behavior of K keybind
            vim.lsp.buf.hover()
          end
        end,
        mode = "n",
      },
    },

    init = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
}
