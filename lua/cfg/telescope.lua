return function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local builtin = require 'telescope.builtin'
  local vimp = require 'vimp'

  local cfg = {
    sorting_strategy = 'ascending',
    shorten_path = true,
    color_devicons = true,
    scroll_strategy = 'cycle',
  }
  telescope.setup {defaults = cfg}

  vimp.nnoremap('<C-p>', builtin.find_files)
  vimp.nnoremap('<C-b>', builtin.buffers)
  vimp.nnoremap('<leader>rg', builtin.live_grep)
  vimp.nnoremap('ts', builtin.builtin)
  vimp.nnoremap({'silent'}, 'gr', builtin.lsp_references)
  vimp.nnoremap({'silent'}, 'g0', builtin.lsp_document_symbols)
  vimp.nnoremap({'silent'}, 'gW', builtin.lsp_workspace_symbols)
end
