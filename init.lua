require("bootstrap")
require("plugins")()

local vimp = require("vimp")

vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.colorcolumn = { "80", "120" }
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

vimp.bind("nvo", { "silent" }, "<F2>", [[:nohl<CR>]])
vimp.tnoremap({ "silent" }, "<Esc>", [[<C-\><C-n>]])

vim.cmd([[
  autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 tabstop=8 shiftwidth=8
]])

vim.cmd([[
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufRead,BufNewFile zsh* set filetype=zsh
]])

-- OS specific settings
if vim.fn.has("mac") == 1 then
	vim.g.python3_host_prog = "/usr/local/bin/python3"
end
