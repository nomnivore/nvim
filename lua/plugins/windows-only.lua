-- plugin configs/overrides that should only run on windows

local function is_windows()
  return jit.os:find("Windows")
end

return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = function(opts)
      if is_windows() then
        opts.servers.nil_ls = nil
      end

      return opts
    end,
  },
}
