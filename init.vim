if !exists('g:vscode')
  if &compatible
    set nocompatible
  endif

  function! PackagerInit() abort
    packadd vim-packager
    call packager#init()

    "vim-packager up first
    call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})

    "UI and Visual plugins
    call packager#add('bling/vim-bufferline')
    call packager#add('lifepillar/vim-solarized8')
    call packager#add('metakirby5/codi.vim')
    call packager#add('mhinz/vim-signify')
    call packager#add('mhinz/vim-startify')
    call packager#add('nvim-lua/plenary.nvim')
    call packager#add('nvim-lua/popup.nvim')
    call packager#add('nvim-lua/telescope.nvim')
    call packager#add('scrooloose/nerdtree')
    call packager#add('vim-airline/vim-airline')
    call packager#add('vim-airline/vim-airline-themes')
    call packager#add('vim-scripts/bufexplorer.zip')
    call packager#add('ryanoasis/vim-devicons')

    "Utility plugins
    call packager#add('Shougo/deol.nvim')
    call packager#add('bronson/vim-trailing-whitespace')
    call packager#add('editorconfig/editorconfig-vim')
    call packager#add('godlygeek/tabular')
    call packager#add('justinmk/vim-sneak')
    call packager#add('tpope/vim-dispatch')
    call packager#add('tpope/vim-fugitive')
    call packager#add('tpope/vim-repeat')
    call packager#add('tpope/vim-surround')
    call packager#add('vim-scripts/SearchComplete')
    call packager#add('vim-scripts/The-NERD-Commenter')
    call packager#add('vim-scripts/a.vim')

    "General dev plugins
    call packager#add('Raimondi/delimitMate')
    call packager#add('diepm/vim-rest-console')
    call packager#add('neovim/nvim-lspconfig')
    call packager#add('nvim-lua/completion-nvim')
    call packager#add('nvim-lua/diagnostic-nvim')
    call packager#add('nvim-treesitter/nvim-treesitter')

    "Go plugins
    call packager#add('fatih/vim-go', {'tag': 'v1.23', 'do': ':GoInstallBinaries'})

    "C plugins
    "call packager#add('etaf/cscope_maps.vim')

    "Rust plugins
    call packager#add('rust-lang/rust.vim')

    "Elixir plugins
    call packager#add('elixir-lang/vim-elixir')
    call packager#add('slashmili/alchemist.vim')

    "Lisp plugins
    call packager#add('kien/rainbow_parentheses.vim', {'on_ft': ['clojure','lisp', 'scheme', 'racket']})

    "Markdown plugins
    call packager#add('mzlogin/vim-markdown-toc')
    call packager#add('suan/vim-instant-markdown')

    "Misc language and filetypes
    call packager#add('sheerun/vim-polyglot')
    call packager#add('stfl/meson.vim')
  endfunction

  command! PackagerInstall call PackagerInit() | call packager#install()
  command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
  command! PackagerClean call PackagerInit() | call packager#clean()
  command! PackagerStatus call PackagerInit() | call packager#status()

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
  "let g:airline#extensions#nvimlsp#enabled = 0

  "telescope.nvim settings
  nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
  nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
  nnoremap <silent> g0 <cmd>lua require'telescope.builtin'.lsp_document_symbols{ shorten_path = true }<CR>
  nnoremap <silent> gW <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{ shorten_path = true }<CR>

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

  "diagnostic-nvim settings
  let g:diagnostic_enable_virtual_text = 1
  "let g:diagnostic_insert_delay = 1

  packloadall
  lua init = require("init")
endif
