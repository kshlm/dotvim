local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local vimp = require 'vimp'

local cfg = {
  color_devicons = true,
  layout_strategy = 'flex',
  scroll_strategy = 'cycle',
  shorten_path = true,
  sorting_strategy = 'ascending',
}
telescope.setup {defaults = cfg}

local bind_opts = {'silent'}
vimp.nnoremap(bind_opts, '<C-p>', builtin.find_files)
vimp.nnoremap(bind_opts, '<C-b>', builtin.buffers)
vimp.nnoremap(bind_opts, '<leader>rg', builtin.live_grep)
vimp.nnoremap(bind_opts, 'ts', builtin.builtin)
