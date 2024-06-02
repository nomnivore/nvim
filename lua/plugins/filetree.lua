return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true, -- plugin is managed by LazyVim
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },
}
