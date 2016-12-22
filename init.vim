if has('vim_starting')
  set nocompatible
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'junegunn/fzf', {'do': './install --bin'} | Plug 'junegunn/fzf.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/vimproc', {'do':  'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim' " MRU plugin includes unite.vim MRU sources
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SearchComplete'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'a.vim'
Plug 'bufexplorer.zip'
Plug 'The-NERD-Commenter'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --gocode-completer --racer-completer'}
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
Plug 'altercation/vim-colors-solarized'
Plug 'diepm/vim-rest-console'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', {'for': ['go'], 'tag': 'v1.10'} " Go development plugin for Vim
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

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


"Syntastic configuration
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_go_checkers = ['gometalinter', 'golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']}

let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

"Vim-Go configuration
let g:go_list_type = "quickfix"

tnoremap <Esc> <c-\><c-n>

let g:solarized_bold=1
let g:solarized_italic=1
let g:solarized_underline=1

colorscheme solarized
set bg=dark

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_solarized'
