if !exists('g:vscode')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

  if dein#load_state('~/.config/nvim/bundle')
    call dein#begin('~/.config/nvim/bundle')

    "Shougo's plugins
    call dein#add('~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deol.nvim')

    "UI and Visual plugins
    call dein#add('lifepillar/vim-solarized8')
    call dein#add('bling/vim-bufferline')
    call dein#add('mhinz/vim-signify')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdtree')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('vim-scripts/bufexplorer.zip')
    call dein#add('metakirby5/codi.vim')
    call dein#add('nvim-lua/popup.nvim')
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-lua/telescope.nvim')
    call dein#add('nvim-lua/lsp-status.nvim')

    "Utility plugins
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('godlygeek/tabular')
    call dein#add('justinmk/vim-sneak')
    call dein#add('tpope/vim-dispatch')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('vim-scripts/SearchComplete')
    call dein#add('vim-scripts/The-NERD-Commenter')
    call dein#add('vim-scripts/a.vim')

    "General dev plugins
    call dein#add('Raimondi/delimitMate')
    call dein#add('diepm/vim-rest-console')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('nvim-lua/completion-nvim')
    call dein#add('nvim-lua/diagnostic-nvim')

    "Go plugins
    call dein#add('fatih/vim-go', {'rev': 'v1.23'})

    "C plugins
    "call dein#add('etaf/cscope_maps.vim')

    "Rust plugins
    call dein#add('rust-lang/rust.vim')

    "Elixir plugins
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('slashmili/alchemist.vim')

    "Lisp plugins
    call dein#add('kien/rainbow_parentheses.vim', {'on_ft': ['clojure','lisp', 'scheme', 'racket']})

    "Markdown plugins
    call dein#add('mzlogin/vim-markdown-toc')
    call dein#add('suan/vim-instant-markdown')

    "Misc language and filetypes
    call dein#add('sheerun/vim-polyglot')
    call dein#add('stfl/meson.vim')


    call dein#end()
    call dein#save_state()
  endif

  "General settings
  set nobackup
  set mouse=
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set smarttab
  set showcmd
  set rnu
  set nu
  set showmatch
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set autoindent
  set smartindent
  set scrolloff=5
  filetype plugin indent on
  set ruler
  syntax on
  set ofu=syntaxcomplete#Complete
  set hidden
  set foldmethod=syntax
  set nofoldenable

  map <F2> :nohl<CR>
  map <F3> :set paste!<CR>

  tnoremap <Esc> <C-\><C-n>

  "
  " General, UI and utility plugin settings
  "

  "Vim-sneak settings
  let g:sneak#label = 1
  let g:sneak#use_ic_scs = 0
  autocmd ColorScheme * hi SneakLabel guifg=black guibg=red ctermfg=black ctermbg=red


  "UI settings at the end
  set background=dark
  set termguicolors " if you want to run vim in a terminal
  colorscheme solarized8
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'solarized'
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#nvimlsp#enabled = 0

  "nvim-treesitter settings
lua <<EOF
EOF

  "telescope.nvim settings
  nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
  nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
  nnoremap <silent> g0 <cmd>lua require'telescope.builtin'.lsp_document_symbols{ shorten_path = true }<CR>
  nnoremap <silent> gW <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{ shorten_path = true }<CR>

  " Statusline
  function! LspStatus() abort
      let status = luaeval("require('lsp-status').status()")
      return trim(status)
  endfunction
  call airline#parts#define_function('lsp_statusline', 'LspStatus')
  call airline#parts#define_condition('lsp_statusline', 'luaeval("#vim.lsp.buf_get_clients() > 0")')
  let g:airline_section_warning = airline#section#create_right(['lsp_statusline'])

  "
  " Development and language settings
  "

  "C settings
  autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 colorcolumn=81 tabstop=8 shiftwidth=8

  "Vim-Go configuration
  let g:go_list_type = "quickfix"
  let g:go_def_mode = 'gopls'
  let g:go_info_mode = 'gopls'

  "Misc filetype settings
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead *.xlator set filetype=toml

  "nvim-lsp settings
  set omnifunc=v:lua.vim.lsp.omnifunc

  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>

  "nvim-lsp colors
  function! s:lspColors() abort
    highlight! link LspDiagnosticsError ErrorMsg
    "highlight LspDiagnosticsErrorSign
    highlight! link LspDiagnosticsWarning WarningMsg
    "highlight LspDiagnosticsWarningSign
    highlight! link LspDiagnosticsInformation MoreMsg
    "highlight LspDiagnosticsInformationSign
    highlight! link LspDiagnosticsHint MoreMsg
    "highlight LspDiagnosticsHintSign
    highlight! link LspReferenceText Comment
    highlight! link LspReferenceRead Comment
    highlight! link LspReferenceWrite Comment
  endfunction
  autocmd ColorScheme * call s:lspColors()

  "completion-nvim settings
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  set completeopt=menuone,noinsert,noselect
  set shortmess+=c

  "diagnostiv-nvim settings
  let g:diagnostic_enable_virtual_text = 1
  "let g:diagnostic_insert_delay = 1

  lua init = require("init")
endif
