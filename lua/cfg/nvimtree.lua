return function()
  local vimp = require 'vimp'

  -- highlight link NvimTreeFolderName Title
  -- highlight link NvimTreeFolderIcon Tag
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_indent_markers = 1

  vimp.nnoremap({'silent'}, '<F3>', ':NvimTreeToggle<CR>')
  vimp.nnoremap({'silent'}, '<Leader><F3>', ':NvimTreeFindFile<CR>')
end
