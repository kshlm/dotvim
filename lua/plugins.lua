local function load(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'svermeulen/vimpeccable'}

  -- UI and Visual plugins
  use 'lifepillar/vim-solarized8'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config  = function()
      local lualine = require 'lualine'
      lualine.theme = 'solarized'
      lualine.status()
    end,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  }
  use 'mhinz/vim-signify'

  -- Utility plugins
  use 'editorconfig/editorconfig-vim'
  use 'godlygeek/tabular'
  use 'justinmk/vim-sneak'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'vim-scripts/a.vim'
  use 'wellle/targets.vim'

  -- General dev plugins
  use 'cohama/lexima.vim'
  use 'hrsh7th/vim-vsnip'
  use {
    'hrsh7th/nvim-compe',
    config = function() require 'cfg.compe' end,
  }
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use {
    'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- Go plugins
  use {
    'fatih/vim-go',
    tag = 'v1.23',
    run = ':GoInstallBinaries',
  }

  -- Rust plugins
  use 'rust-lang/rust.vim'

  -- Elixir plugins
  use 'elixir-lang/vim-elixir'

  -- Misc language and filetypes
  use 'sheerun/vim-polyglot'

  -- nvim-lua devel plugins
  use 'rafcamlet/nvim-luapad'
end

return function()
  vim.cmd 'packadd packer.nvim'
  local packer = require 'packer'
  packer.startup {load}
  vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
end