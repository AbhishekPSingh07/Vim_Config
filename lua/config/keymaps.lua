-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>br",
  ":let current_buffer = buffnr() <bar> :bnext <bar> :buffer" .. vim.fn.getbufline("%", 1) .. "<CR>",
  { noremap = true, silent = true }
)
