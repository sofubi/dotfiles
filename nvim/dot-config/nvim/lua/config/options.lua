-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "basedpyright"

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"

  vim.opt.linespace = 5

  vim.g.neovide_window_blurred = true
  vim.g.neovide_transparency = 0.85

  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end
