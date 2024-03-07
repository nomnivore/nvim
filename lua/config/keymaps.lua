-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

if Util.has("copilot.lua") then
  vim.keymap.set("n", "<leader>cc", function()
    require("copilot.panel").open({ position = "right" })
  end, { desc = "Copilot Panel" })
end

-- keybind to save current file
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>w<CR>", { noremap = true, desc = "Save current file" })
-- all files
vim.api.nvim_set_keymap("n", "<leader>fa", "<cmd>wall<CR>", { noremap = true, desc = "Save all files" })

-- shift+enter to newline below without breaking the current line
vim.api.nvim_set_keymap("i", "<S-CR>", "<C-o>o", { expr = true, noremap = true, desc = "Move to new line below" })

-- override default keymaps for smarter behaviors
-- FIXME: this doesn't work

-- this keybind properly indents empty lines
-- vim.keymap.set("n", "i", function()
--   if vim.fn.empty(vim.fn.trim(vim.api.nvim_get_current_line())) == 1 then
--     return [["_cc]]
--   else
--     return "i"
--   end
-- end, { desc = "Insert Mode" })

-- don't yank empty line to default register on 'dd'
-- vim.keymap.set("n", "dd", function()
--   if vim.fn.empty(vim.fn.trim(vim.api.nvim_get_current_line())) == 1 then
--     return [["_dd]]
--   else
--     return "dd"
--   end
-- end, { desc = "Delete Line" })

-- support for tmux pane navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Move to the left window" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Move to the right window" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Move to the lower window" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Move to the upper window" })
