local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local vimp = require 'vimp'

local cfg = {
  color_devicons = true,
  layout_strategy = 'flex',
  prompt_position = 'top',
  scroll_strategy = 'cycle',
  shorten_path = true,
  sorting_strategy = 'ascending',
}
telescope.setup {defaults = cfg}

vimp.nnoremap('<C-p>', builtin.find_files)
vimp.nnoremap('<C-b>', builtin.buffers)
vimp.nnoremap('<leader>rg', builtin.live_grep)
vimp.nnoremap('ts', builtin.builtin)
-- vimp.nnoremap({'silent'}, 'gr', builtin.lsp_references)
vimp.nnoremap({'silent'}, 'g0', builtin.lsp_document_symbols)
vimp.nnoremap({'silent'}, 'gW', builtin.lsp_workspace_symbols)
