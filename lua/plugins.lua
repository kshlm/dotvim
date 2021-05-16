local function load(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- Some helpers
  use 'svermeulen/vimpeccable'
  use 'famiu/nvim-reload'

  -- UI and Visual plugins
  use 'lifepillar/vim-solarized8'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require 'cfg.lualine' end,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require 'cfg.nvimtree' end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function() require 'cfg.telescope' end,
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

  --
  -- General dev plugins
  --
  -- Treesitter things
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function() require 'cfg.treesitter' end,
  }
  use {
    'romgrk/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  -- LSP things
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'kabouzeid/nvim-lspinstall',
      'glepnir/lspsaga.nvim'
    },
    config = function() require 'cfg.lsp' end,
  }
  use {
    'onsails/lspkind-nvim',
    requires = 'neovim/nvim-lspconfig',
    config = function() require'lspkind'.init() end,
  }
  use 'folke/lsp-colors.nvim'
  -- Others
  use 'cohama/lexima.vim'
  use 'hrsh7th/vim-vsnip'
  use {
    'hrsh7th/nvim-compe',
    config = function() require 'cfg.compe' end,
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function() require'nvim-ts-autotag'.setup() end,
  }

  -- Scala plugins
  use {
    'scalameta/nvim-metals',
    ft = {'scala', 'sbt'},
    config = function() require 'cfg.metals' end,
  }
end

return function()
  vim.cmd 'packadd packer.nvim'
  local packer = require 'packer'
  packer.startup {load}
  vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
end
