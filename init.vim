if has('vim_starting')
  set nocompatible
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'junegunn/fzf', {'do': './install --bin'} | Plug 'junegunn/fzf.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/The-NERD-Commenter'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'Raimondi/delimitMate'
Plug 'zah/nimrod.vim', {'for': 'nim'} " 1.0   Nimrod syntax support
Plug 'kien/rainbow_parentheses.vim', {'for': ['clojure','lisp', 'scheme', 'racket']} " Better Rainbow Parentheses
Plug 'chilicuil/vim-sml-coursera', {'for': 'sml'} " vim + sml for https://class.coursera.org/proglang-002/class/index
Plug 'chase/vim-ansible-yaml', {'for': 'ansible'} " Add additional support for Ansible in VIM
Plug 'saltstack/salt-vim', {'for': 'salt'} " Vim files for editing Salt files
Plug 'etaf/cscope_maps.vim', { 'for' : ['c']} " a mirror of http://cscope.sourceforge.net/cscope_maps.vim
Plug 'fhenrysson/vim-protobuf' " Syntax highlighting of Google protobuf
Plug 'jigish/vim-thrift' " Thrift Syntax
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'diepm/vim-rest-console'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', {'for': ['go'], 'tag': 'v1.12'} " Go development plugin for Vim
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
"Plug 'tweekmonster/deoplete-clang2'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'

Plug 'kassio/neoterm'

call plug#end()

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

set gfn=Fantasque\ Sans\ Mono\ 11

autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 colorcolumn=81 tabstop=8 shiftwidth=8

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.xlator set filetype=toml


map <F2> :nohl<CR>
map <F3> :set paste!<CR>

"FZF Ctrl-P
nmap <C-P> :FZF<enter>
nmap <C-B> :Buffers<enter>

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"Syntastic configuration
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet', 'gofmt']
let g:syntastic_c_checkers = ['clang_tidy']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_c_clang_tidy_post_args = ""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active'}

"Vim-Go configuration
let g:go_list_type = "quickfix"

tnoremap <Esc> <c-\><c-n>

set background=dark
"set termguicolors " if you want to run vim in a terminal
colorscheme solarized
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
