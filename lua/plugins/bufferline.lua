-- fix x icon not showing (lazyvim bug?)
if true then
  return {}
end
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      buffer_close_icon = "",
    },
  },
}
