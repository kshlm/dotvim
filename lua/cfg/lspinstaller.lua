local lspinstaller = require("nvim-lsp-installer")
local lsputils = require("cfg.lsputils")

lspinstaller.on_server_ready(function(server)
	server:setup(lsputils.make_config())
end)
