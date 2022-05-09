local lspinstaller = require("nvim-lsp-installer")
local lsputils = require("cfg.lsputils")

local configs = {
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- LuaJIT in the case of Neovim
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
}
--[[ lspinstaller.on_server_ready(function(server)
	server:setup(lsputils.make_config(configs[server.name] or {}))
end) ]]
