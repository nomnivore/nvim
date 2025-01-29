-- plugin configs/overrides that should only run on windows

local function is_windows()
  return jit.os:find("Windows")
end

if vim.g.neovide then
  vim.o.shell = "pwsh.exe -nologo"
  -- vim.o.guifont = "Monaspace Neon,Hack Nerd Font"
  -- using bundled font for now, my fonts cause line-height issues that are being worked on
  vim.g.neovide_title_background_color = "#181825"

  -- maybe there is a better way to sync up with colorscheme?
  -- for now this is catppuccin mocha
  if vim.g.neovide then
    vim.g.terminal_color_0 = "#45475a"
    vim.g.terminal_color_1 = "#f38ba8"
    vim.g.terminal_color_2 = "#a6e3a1"
    vim.g.terminal_color_3 = "#f9e2af"
    vim.g.terminal_color_4 = "#89b4fa"
    vim.g.terminal_color_5 = "#f5c2e7"
    vim.g.terminal_color_6 = "#94e2d5"
    vim.g.terminal_color_7 = "#bac2de"
    vim.g.terminal_color_8 = "#585b70"
    vim.g.terminal_color_9 = "#f38ba8"
    vim.g.terminal_color_10 = "#a6e3a1"
    vim.g.terminal_color_11 = "#f9e2af"
    vim.g.terminal_color_12 = "#89b4fa"
    vim.g.terminal_color_13 = "#f5c2e7"
    vim.g.terminal_color_14 = "#94e2d5"
    vim.g.terminal_color_15 = "#a6adc8"
  end
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
