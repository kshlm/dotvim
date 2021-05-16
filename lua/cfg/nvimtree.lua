local vimp = require 'vimp'

vim.cmd [[ highlight link NvimTreeFolderName Title ]]
vim.cmd [[ highlight link NvimTreeFolderIcon Tag ]]
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1

local bind_opts = {'silent'}
vimp.nnoremap(bind_opts, '<F3>', ':NvimTreeToggle<CR>')
vimp.nnoremap(bind_opts, '<Leader><F3>', ':NvimTreeFindFile<CR>')
