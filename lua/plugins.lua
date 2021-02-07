local function load(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'svermeulen/vimpeccable', opt = true}

  -- UI and Visual plugins
  use 'lifepillar/vim-solarized8'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config  = function()
      local lualine = require 'lualine'
      lualine.theme = 'solarized'
      lualine.status()
    end,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local cfg = {
        sorting_strategy = 'ascending',
        prompt_position = 'top',
        color_devicons = true,
        scroll_strategy = 'cycle',
        mappings = {
          i = {
            ['<C-K>'] = actions.move_selection_previous,
            ['<C-J>'] = actions.move_selection_next,
            ['<Esc>'] = actions.close,
          },
        }
      }
      telescope.setup {defaults = cfg}
    end,
  }
  use 'mhinz/vim-signify'

  -- Utility plugins
  use 'editorconfig/editorconfig-vim'
  use 'godlygeek/tabular'
  use 'justinmk/vim-sneak'
  use 'preservim/nerdcommenter'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'vim-scripts/a.vim'
  use 'wellle/targets.vim'

  -- General dev plugins
  use 'cohama/lexima.vim'
  use {
    'hrsh7th/nvim-compe',
    config = function()
      --vim.o.completeopt = "menu,menuone,noselect"
      --require'compe'.setup {
        --enabled = true;
        --autocomplete = true;
        --debug = false;
        --min_length = 1;
        --preselect = 'enable';
        --throttle_time = 80;
        --source_timeout = 200;
        --incomplete_delay = 400;
        --max_abbr_width = 100;
        --max_kind_width = 100;
        --max_menu_width = 100;

        --source = {
          --path = true;
          --buffer = true;
          --calc = true;
          --nvim_lsp = true;
          --nvim_lua = true;
          --treesitter = true;
        --};
      --}
      pcall("cfg.compe")
    end
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

  -- C plugins
  --call packager#add('etaf/cscope_maps.vim')

  -- Rust plugins
  use 'rust-lang/rust.vim'

  -- Elixir plugins
  use 'elixir-lang/vim-elixir'
  use 'slashmili/alchemist.vim'

  -- Markdown plugins
  use 'mzlogin/vim-markdown-toc'
  use 'suan/vim-instant-markdown'

  -- Misc language and filetypes
  use 'sheerun/vim-polyglot'
  use 'stfl/meson.vim'

  -- nvim-lua devel plugins
  use 'tjdevries/nlua.nvim'
  use 'bfredl/nvim-luadev'
end

return function()
  vim.cmd 'packadd packer.nvim'
  local packer = require 'packer'
  packer.startup {load}
  vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
end
