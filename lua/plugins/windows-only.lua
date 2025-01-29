-- plugin configs/overrides that should only run on windows

local function is_windows()
  return jit.os:find("Windows")
end

if vim.g.neovide then
  vim.o.shell = "pwsh.exe -nologo"
  vim.o.guifont = "Monaspace Neon,Hack Nerd Font:h14"
  vim.g.neovide_title_background_color = "#181825"
end

return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = function(_, opts)
      if is_windows() then
        opts.servers.nil_ls = nil
      end

      return opts
    end,
  },
}
