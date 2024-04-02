-- allows exiting insert mode by pressing 'jk'
-- without the usual shortcomings of a simple keymap
return {
  "max397574/better-escape.nvim",
  event = "InsertEnter",

  opts = {
    mapping = { "jk" },
  },
}
