-- All LSP related config goes here
local lspconfig = require("lspconfig")
local saga = require("lspsaga")
local lsputils = require("cfg.lsputils")

local function setup_servers()
	local servers = {
		clangd = {},
		gopls = {
			settings = {
				gopls = {
					analyses = {
						nilness = true,
						shadow = true,
						unusedparams = true,
					},
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
				},
			},
		},
		zls = {},
		rust_analyzer = {
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		},
		rnix = {},
	}

	if vim.fn.has("mac") == 1 then
		servers.clangd.cmd = { "/usr/local/opt/llvm/bin/clangd" }
	end

	for lang, config in pairs(servers) do
		lspconfig[lang].setup(lsputils.make_config(config))
	end
end
setup_servers()

-- lsp-diagnostic settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	underline = true,
	update_in_insert = false,
	virtual_text = true,
})

-- lspsaga settings
saga.init_lsp_saga({
	code_action_prompt = {
		sign = false,
	},
	code_action_keys = {
		quit = "<Esc>",
	},
})
