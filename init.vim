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
  call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': 'bash install.sh'})
  call dein#add('w0rp/ale')

  "Go plugins
  call dein#add('fatih/vim-go', {'rev': 'v1.20'})

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
nmap <C-P> :Denite file/rec<Enter>
nmap <C-B> :Denite buffer<Enter>
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  ""Extra rg settings
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

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
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

"LanguageClient settings
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls'],
       \ 'cpp': ['clangd'],
       \ 'c': ['clangd'],
       \ 'python': ['pyls'],
       \ 'rust': ['rls'],
       \ 'yaml': ['yaml-language-server'],
       \ }

"C settings
autocmd Filetype c,cpp,cs,java,objc setlocal formatoptions+=cqrtnj textwidth=80 colorcolumn=81 tabstop=8 shiftwidth=8

"Vim-Go configuration
let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

"Misc filetype settings
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.xlator set filetype=toml

