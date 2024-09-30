-- disable autopair for single quote in Rust
-- https://www.reddit.com/r/neovim/comments/171xezk/disable_minipair_based_on_buffer_file_type/
vim.keymap.set("i", "'", "'", { buffer = 0 })
