local lualine = require 'lualine'
lualine.setup(
  {
    options = {
      theme = 'solarized_dark',
    },
    sections = {
      lualine_a = { {'mode', upper = true} },
      lualine_b = { {'branch', icon = ''} },
      lualine_c = { 'diff', {'filename', file_status = true} },
      lualine_x = { {'diagnostics', sources = {'nvim_lsp'} } },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'progress', 'location'  },
    },
  }
)
