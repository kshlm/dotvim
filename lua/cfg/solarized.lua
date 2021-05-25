local setup_lualine = require('cfg.lualine')
if vim.fn.has('mac') then
  require('dark_notify').run(
    {
      onchange = require('cfg.lualine')
    }
  )
else
  vim.o.background = 'light'
  setup_lualine()
end
vim.o.termguicolors = true
vim.cmd [[
colorscheme solarized
syntax on
]]
