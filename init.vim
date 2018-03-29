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

  "UI and Visual plugins
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('bling/vim-bufferline')
  call dein#add('majutsushi/tagbar')
  call dein#add('mhinz/vim-signify')
  call dein#add('mhinz/vim-startify')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-scripts/bufexplorer.zip')
  call dein#add('metakirby5/codi.vim')

  "Utility plugins
  "call dein#add('Lokaltog/vim-easymotion')
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
  call dein#add('scrooloose/syntastic')

  "Go plugins
  call dein#add('fatih/vim-go', {'on_ft': ['go'], 'rev': 'v1.17'})
  call dein#add('zchee/deoplete-go', { 'build': 'make'})

  "C plugins
  call dein#add('etaf/cscope_maps.vim', { 'on_ft' : ['c']})
  call dein#add('zchee/deoplete-clang')
  "call dein#add('tweekmonster/deoplete-clang2')

  "Python plugins
  call dein#add('zchee/deoplete-jedi')

  "Elixir plugins
  call dein#add('elixir-lang/vim-elixir', {'on_ft': 'elixir'})
  call dein#add('slashmili/alchemist.vim', {'on_ft': 'elixir'})

  "Lisp plugins
  call dein#add('kien/rainbow_parentheses.vim', {'on_ft': ['clojure','lisp', 'scheme', 'racket']})

  "Misc language and filetypes
  call dein#add('sheerun/vim-polyglot')
  "call dein#add('cespare/vim-toml')
  "call dein#add('chase/vim-ansible-yaml', {'on_ft': 'ansible'})
  "call dein#add('chilicuil/vim-sml-coursera', {'on_ft': 'sml'})
  "call dein#add('fhenrysson/vim-protobuf')
  "call dein#add('jigish/vim-thrift')
  "call dein#add('puppetlabs/puppet-syntax-vim')
  "call dein#add('saltstack/salt-vim', {'on_ft': 'salt'})
  "call dein#add('zah/nimrod.vim', {'on_ft': 'nim'})

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
set list
syntax on
set ofu=syntaxcomplete#Complete
set hidden

set foldmethod=syntax
set nofoldenable

map <F2> :nohl<CR>
map <F3> :set paste!<CR>

"Gui settings
set gfn=Fantasque\ Sans\ Mono\ 11

"C settings
autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 colorcolumn=81 tabstop=8 shiftwidth=8

"Vim-Go configuration
let g:go_list_type = "quickfix"

"Misc filetype settings
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.xlator set filetype=toml

"Denite settings
nmap <C-P> :Denite file_rec<Enter>
nmap <C-B> :Denite buffer<Enter>
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
  call denite#custom#var('grep', 'command', ['ack'])
  call denite#custom#var('grep', 'default_opts', ['--ackrc', $HOME.'/.ackrc', '-H', '--nopager', '--nocolor', '--nogroup', '--column'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--match'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  ""Extra rg settings
  "set grepprg=rg\ --vimgrep
  "set grepformat^=%f:%l:%c:%m
endif

"Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"Syntastic configuration
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet', 'gofmt']
let g:syntastic_c_checkers = ['clang_tidy']
let g:syntastic_javascript_checkers = ['eslint', 'jshint', 'jslint']
let g:syntastic_c_clang_tidy_post_args = ""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active'}

"Vim-sneak settings
let g:sneak#label = 1
let g:sneak#use_ic_scs = 0
autocmd ColorScheme * hi SneakLabel guifg=black guibg=red ctermfg=black ctermbg=red

"UI settings at the end
set background=light
"set termguicolors " if you want to run vim in a terminal
colorscheme solarized
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
