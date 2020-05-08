if !exists('g:vscode')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

  if dein#load_state('~/.config/nvim/bundle')
    call dein#begin('~/.config/nvim/bundle')

    "Shougo's plugins
    call dein#add('~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/deol.nvim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neoyank.vim')

    "UI and Visual plugins
    call dein#add('lifepillar/vim-solarized8')
    call dein#add('bling/vim-bufferline')
    call dein#add('majutsushi/tagbar')
    call dein#add('mhinz/vim-signify')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdtree')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('vim-scripts/bufexplorer.zip')
    call dein#add('metakirby5/codi.vim')

    "Utility plugins
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('godlygeek/tabular')
    call dein#add('justinmk/vim-sneak')
    call dein#add('neoclide/denite-extra')
    call dein#add('neoclide/denite-git')
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
    call dein#add('Shougo/echodoc.vim')
    call dein#add('neovim/nvim-lsp')

    "Go plugins
    call dein#add('fatih/vim-go', {'rev': 'v1.22'})

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

  "Denite settings
  call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

  call denite#custom#var('file/rec', 'command',
        \ ['fd', '-H', '--full-path'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--hidden', '--vimgrep', '--smart-case'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#option('_', 'max_dynamic_update_candidates', 100000)
  call denite#custom#option('_', {
        \ 'split': 'floating',
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_matched_range': 'NormalFloat',
        \ 'wincol': &columns / 6,
        \ 'winwidth': &columns * 2 / 3,
        \ 'winrow': &lines / 6,
        \ 'winheight': &lines * 2 / 3
        \ })

  autocmd FileType denite call s:denite_settings()

  function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-v>
          \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> d
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <Esc>
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
  endfunction

  autocmd FileType denite-filter call s:denite_filter_settings()

  function! s:denite_filter_settings() abort
    nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
  endfunction

  nnoremap <C-p> :<C-u>Denite file/rec -start-filter<CR>
  nnoremap <leader>s :<C-u>Denite buffer<CR>
  nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
  nnoremap <leader>/ :<C-u>Denite -start-filter grep:::!<CR>
  nnoremap <leader><Space>/ :<C-u>DeniteBufferDir -start-filter grep:::!<CR>
  nnoremap <leader>d :<C-u>DeniteBufferDir file/rec -start-filter<CR>
  nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
  nnoremap <leader><C-r> :<C-u>Denite register:.<CR>
  nnoremap <leader>g :<C-u>Denite gitstatus<CR>

  "Vim-sneak settings
  let g:sneak#label = 1
  let g:sneak#use_ic_scs = 0
  autocmd ColorScheme * hi SneakLabel guifg=black guibg=red ctermfg=black ctermbg=red

  "Tagbar
  autocmd VimEnter * nested :call tagbar#autoopen(1)
  autocmd BufEnter * nested :call tagbar#autoopen(0)
  autocmd FileType * nested :call tagbar#autoopen(0)

  "UI settings at the end
  set background=dark
  set termguicolors " if you want to run vim in a terminal
  colorscheme solarized8
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'solarized'
  let g:airline#extensions#ale#enabled = 1


  "
  " Development and language settings
  "

  "Deoplete settings
  let g:deoplete#enable_at_startup = 1

  "Echodoc settings
  set cmdheight=2
  let g:echodoc#enable_at_startup = 1
  let g:echodoc#type = 'signature'

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
  set omnifunc=lsp#ominfunc

  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
lua <<EOF
nvim_lsp = require 'nvim_lsp'

nvim_lsp.vimls.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.pyls.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.jsonls.setup{}
nvim_lsp.metals.setup{}
nvim_lsp.sumneko_lua.setup{cmd = { "/Users/kaushal/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/kaushal/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" }}
EOF


endif
