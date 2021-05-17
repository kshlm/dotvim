require'plugins'()

local set = require'utils'.set
local vimp = require'vimp'

-- vim.o.background = 'dark'
-- vim.o.termguicolors = true
-- vim.cmd [[
--   colorscheme solarized
--   syntax on
-- ]]

local all_opts = {
  o = {
    backup = false,
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    mouse = 'a',
    ruler = true,
    scrolloff = 5,
    shortmess = vim.o.shortmess..'c',
    showmatch = true,
    smartcase = true,
    smarttab = true,
    wildmenu = true,
    wildmode = "full",
  },
  b = {
    autoindent = true,
    expandtab = true,
    shiftwidth = 2,
    smartindent = true,
    tabstop = 2,
  },
  w = {
    colorcolumn = '80,120',
    foldenable = false,
    foldexpr='nvim_treesitter#foldexpr()',
    foldmethod = 'expr',
    number = true,
    relativenumber = true,
  },
}
for scope, opts in pairs(all_opts) do
  for opt, val in pairs(opts) do
    set(scope, opt, val)
  end
end

vimp.bind('nvo', {'silent'}, '<F2>', [[:nohl<CR>]])
vimp.tnoremap({'silent'}, '<Esc>', [[<C-\><C-n>]])

vim.cmd [[
  autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 tabstop=8 shiftwidth=8
]]

vim.cmd [[
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufRead,BufNewFile zsh* set filetype=zsh
]]

-- OS specific settings
if vim.fn.has('mac') == 1 then
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end
