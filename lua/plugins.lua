local function load(use)
	use({ "wbthomason/packer.nvim", opt = true })
	use("lewis6991/impatient.nvim")
	-- Some helpers
	use("svermeulen/vimpeccable")
	use("b0o/mapx.lua")
	use({
		"famiu/nvim-reload",
		config = function()
			require("cfg.reload")
		end,
	})

	-- UI and Visual plugins
	use({
		"https://github.com/kshlm/dracula-pro.git",
		rtp = "vim",
		config = function()
			require("cfg.dracula_pro")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("cfg.lualine")("dracula")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("cfg.nvimtree")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("cfg.telescope")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("folke/lsp-colors.nvim")

	-- Utility plugins
	use("b3nj5m1n/kommentary")
	use("editorconfig/editorconfig-vim")
	use("godlygeek/tabular")
	use("ggandor/lightspeed.nvim")
	use("tpope/vim-dispatch")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("vim-scripts/a.vim")
	use("wellle/targets.vim")

	-- General dev plugins

	-- Treesitter things
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("cfg.treesitter")
		end,
	})
	use({
		"romgrk/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"haringsrob/nvim_context_vt",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require ("indent_blankline").setup({
				show_current_context = true,
			})
		end
	})
	-- Polyglot for everything else
	use("sheerun/vim-polyglot")

	-- LSP things
	use("williamboman/mason.nvim")
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({})
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		--[[ config = function()
			require("cfg.lsp")
		end, ]]
	})
	use({
		"onsails/lspkind-nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("lspkind").init()
		end,
	})
	--[[ use({
		"simrat39/symbols-outline.nvim",
		requires = "neovim/nvim-lspconfig",
	}) ]]
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("cfg.null-ls")
		end,
	})
	--[[ use({
		"folke/trouble.nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("cfg.trouble")
		end,
	}) ]]
	use({
		"ray-x/navigator.lua",
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			{"ray-x/guihua.lua", run = "cd lua/fzy && make"},
			"ray-x/lsp_signature.nvim",
		},
		config = function()
			require("cfg.navigator")
		end,
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end
	})

	-- Completions
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("cfg.cmp")
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		requires = "rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").load()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("cfg.autopairs")
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	-- Language specific plugins
	use("elixir-editors/vim-elixir")
	use({
		"scalameta/nvim-metals",
		config = function()
			require("cfg.metals")
		end,
	})
	use({
		"ray-x/go.nvim",
		ft = { "go", "go.mod" },
		config = function()
			require("cfg.go")
		end,
	})
	use("folke/lua-dev.nvim")

	-- Other dev plugins
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})
end

return function()
	vim.cmd([[packadd packer.nvim]])
	local packer = require("packer")
	packer.startup({
		load,
		config = {
			profile = {
				enable = true,
			},
		},
	})

	vim.cmd([[autocmd BufWritePost **/.config/nvim/lua/** PackerCompile]])
end
