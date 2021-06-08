local vimp = require 'vimp'

vim.cmd [[ highlight link NvimTreeFolderName Title ]]
vim.cmd [[ highlight link NvimTreeFolderIcon Tag ]]
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_lsp_diagnostics = 1

local bind_opts = {'silent'}
vimp.nnoremap(bind_opts, '<F3>', ':NvimTreeToggle<CR>')
vimp.nnoremap(bind_opts, '<Leader><F3>', ':NvimTreeFindFile<CR>')
