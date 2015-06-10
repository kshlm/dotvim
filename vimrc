if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle-vim-recipes'
NeoBundle 'Shougo/vimproc', {'build': {'unix': 'make'},}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neomru.vim' " MRU plugin includes unite.vim MRU sources
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
NeoBundle 'SearchComplete'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'a.vim'
NeoBundle 'bufexplorer.zip'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Valloric/YouCompleteMe', {'build': { 'unix': './install.sh --clang-completer --system-libclang'},}
NeoBundle 'majutsushi/tagbar'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
NeoBundle 'puppetlabs/puppet-syntax-vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'SirVer/ultisnips' " 1.0   The ultimate snippet solution for python enabled Vim.
NeoBundle 'honza/vim-snippets'
NeoBundle 'zah/nimrod.vim' " 1.0   Nimrod syntax support
NeoBundle 'fatih/vim-go' " Go development plugin for Vim
NeoBundleLazy 'DrawIt' " 02242003 Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
NeoBundleLazy 'rygwdn/ropevim-helper' " simple vim plugin to help load ropevim
NeoBundle 'kien/rainbow_parentheses.vim' " Better Rainbow Parentheses
NeoBundle 'chilicuil/vim-sml-coursera' " vim + sml for https://class.coursera.org/proglang-002/class/index
NeoBundle 'chase/vim-ansible-yaml' " Add additional support for Ansible in VIM
NeoBundle 'saltstack/salt-vim' " Vim files for editing Salt files
NeoBundle 'jobbler/asciidoc-environment' " Environment to make writing in asciidoc easier

call neobundle#end()

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

set term=konsole-256color-italic
set t_Co=256
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
autocmd Filetype go setlocal rtp+=$GOROOT/misc/vim

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

let g:powerline_config_overrides={"common": {"term_truecolor": 1}, "ext":{"vim":{"colorscheme" : "solarizedlight"}}}

map <F2> :nohl<CR>
map <F3> :set paste!<CR>

nnoremap <space>s :Unite -quick-match buffer<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <C-p> :Unite file_mru buffer file_rec/async:! -start-insert -buffer-name=files<CR>

let g:syntastic_python_checkers = ['flake8']

let g:solarized_bold=1
let g:solarized_italic=1
let g:solarized_underline=1
colorscheme solarized
set background=light
hi! Comment cterm=italic

let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

NeoBundleCheck
