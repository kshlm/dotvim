-- All LSP related config goes here
local lspconfig = require("lspconfig")
-- local lsputils = require("cfg.lsputils")

local function setup_servers()
	local servers = {
		-- golangci_lint_ls = {},
	}

	for lang, config in pairs(servers) do
		lspconfig[lang].setup({})
	end
end
setup_servers()
