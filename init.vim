if &compatible
  set nocompatible
endif

set background=dark
set termguicolors " if you want to run vim in a terminal

lua init = require 'init'
lua init.setup()

colorscheme solarized8
syntax on

"General settings
set autoindent smartindent
set colorcolumn=80,120
set expandtab smarttab tabstop=2 shiftwidth=2
set hidden nobackup
set hlsearch ignorecase incsearch smartcase
set mouse=a
set nofoldenable foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
set nu rnu ruler
set scrolloff=5
set shortmess+=c
set showcmd
set showmatch
set wildmenu wildmode=full

map <F2> :nohl<CR>

tnoremap <Esc> <C-\><C-n>

"
" General, UI and utility plugin settings
"

"Vim-sneak settings
let g:sneak#label = 1
let g:sneak#use_ic_scs = 0
autocmd ColorScheme * hi SneakLabel guifg=black guibg=red ctermfg=black ctermbg=red


"UI settings at the end

" nvim-tree settings
highlight link NvimTreeFolderName Title
highlight link NvimTreeFolderIcon Tag
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
nnoremap <silent> <F3> :NvimTreeToggle<CR>
nnoremap <silent> <Leader><F3> :NvimTreeFindFile<CR>

"telescope.nvim settings
nnoremap <c-p> :Telescope find_files<CR>
nnoremap <c-b> :Telescope buffers<CR>
nnoremap <leader>rg :Telescope live_grep<CR>
nnoremap <silent> gr :Telescope lsp_references<CR>
nnoremap <silent> g0 :Telescope lsp_document_symbols<CR>
nnoremap <silent> gW :Telescope lsp_workspace_symbols<CR>

"Lexima + Compe
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

"Miscellaneous settings
autocmd BufRead,BufNewFile zsh* set filetype=zsh

"
" Development and language settings
"

"C settings
autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 tabstop=8 shiftwidth=8

"Vim-Go configuration
let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

"Misc filetype settings
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.xlator set filetype=toml

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
