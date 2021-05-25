local setup_lualine = require('cfg.lualine')
if vim.fn.has('mac') == 1 then
  require('dark_notify').run(
    {
      onchange = setup_lualine
    }
  )
else
  vim.o.background = 'dark'
  setup_lualine('dark')
end

vim.o.termguicolors = true
vim.cmd [[
colorscheme solarized
syntax on
]]
