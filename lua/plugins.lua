local function load(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- Some helpers
  use 'svermeulen/vimpeccable'
  use {
    'famiu/nvim-reload',
    config = function() require('cfg.reload') end,
  }

  -- UI and Visual plugins
  use {
    'git@github.com:kshlm/dracula-pro.git',
    rtp = "vim",
    config = function() require('cfg.dracula_pro') end,
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('cfg.lualine')('dracula') end,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('cfg.nvimtree') end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function() require('cfg.telescope') end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }

  -- Utility plugins
  use 'b3nj5m1n/kommentary'
  use 'editorconfig/editorconfig-vim'
  use 'godlygeek/tabular'
  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'vim-scripts/a.vim'
  use 'wellle/targets.vim'

  -- General dev plugins

  -- Treesitter things
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function() require('cfg.treesitter') end,
  }
  use {
    'romgrk/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  use {
    'haringsrob/nvim_context_vt',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  -- Polyglot for everything else
  use 'sheerun/vim-polyglot'

  -- LSP things
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'kabouzeid/nvim-lspinstall',
      'glepnir/lspsaga.nvim'
    },
    config = function() require('cfg.lsp') end,
  }
  use {
    'onsails/lspkind-nvim',
    requires = 'neovim/nvim-lspconfig',
    config = function() require('lspkind').init() end,
  }
  use {
    'simrat39/symbols-outline.nvim',
    requires = 'neovim/nvim-lspconfig',
  }

  -- Others
  use {
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'rafamadriz/friendly-snippets',
  }
  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',
    },
    config = function() require('cfg.compe') end,
  }
  use {
    'windwp/nvim-autopairs',
    requires = 'hrsh7th/nvim-compe',
    config = function() require('cfg.autopairs') end,
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end,
  }

  -- Language specific plugins
  use 'elixir-editors/vim-elixir'
  use {
    'scalameta/nvim-metals',
    config = function() require('cfg.metals') end,
  }
  use {
    'ray-x/go.nvim',
    ft = {'go', 'go.mod'},
    config = function() require('cfg.go') end,
  }
end

return function()
  vim.cmd [[packadd packer.nvim]]
  local packer = require ('packer')
  packer.startup({
    load,
    config = {
      profile = {
        enable = true,
      }
    }
  })

  vim.cmd [[autocmd BufWritePost **/.config/nvim/lua/** PackerCompile]]
end
