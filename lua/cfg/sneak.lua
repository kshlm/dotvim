-- Vim-sneak settings
vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 0
vim.cmd [[
  autocmd ColorScheme * hi SneakLabel guifg=black guibg=red ctermfg=black ctermbg=red
]]

