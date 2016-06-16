if has('vim_starting')
  set nocompatible
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'Shougo/vimproc', {'do':  'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim' " MRU plugin includes unite.vim MRU sources
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SearchComplete'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'a.vim'
Plug 'bufexplorer.zip'
Plug 'The-NERD-Commenter'
Plug 'Valloric/YouCompleteMe', { 'for': ['python','c'], 'do': './install.sh --clang-completer --gocode-completer'}
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'Raimondi/delimitMate'
Plug 'zah/nimrod.vim' " 1.0   Nimrod syntax support
Plug 'kien/rainbow_parentheses.vim', {'for': ['clojure','lisp', 'scheme', 'racket']} " Better Rainbow Parentheses
Plug 'chilicuil/vim-sml-coursera' " vim + sml for https://class.coursera.org/proglang-002/class/index
Plug 'chase/vim-ansible-yaml' " Add additional support for Ansible in VIM
Plug 'saltstack/salt-vim' " Vim files for editing Salt files
Plug 'etaf/cscope_maps.vim' " a mirror of http://cscope.sourceforge.net/cscope_maps.vim
Plug 'fhenrysson/vim-protobuf' " Syntax highlighting of Google protobuf
Plug 'jigish/vim-thrift' " Thrift Syntax
Plug 'elixir-lang/vim-elixir'
Plug 'altercation/vim-colors-solarized'
"Go plugins
Plug 'fatih/vim-go', {'for': ['go']} " Go development plugin for Vim
Plug 'Shougo/deoplete.nvim', {'for': ['go']}
Plug 'zchee/deoplete-go', {'for': ['go'], 'do': 'make'}

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

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set foldmethod=syntax
set nofoldenable

set gfn=Fantasque\ Sans\ Mono\ 11

autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 colorcolumn=81 tabstop=8 shiftwidth=8
"autocmd Filetype go setlocal rtp+=$GOROOT/misc/vim

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby


map <F2> :nohl<CR>
map <F3> :set paste!<CR>

nnoremap <space>s :Unite -quick-match buffer<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <C-p> :Unite file_mru buffer file_rec/async:! -start-insert -buffer-name=files<CR>

"Syntastic configuration
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['govet', 'golint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']}

let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

tnoremap <Esc> <c-\><c-n>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

let g:solarized_bold=1
let g:solarized_italic=1
let g:solarized_underline=1
hi! Comment cterm=italic

colorscheme solarized
set bg=light

"let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_solarized'
