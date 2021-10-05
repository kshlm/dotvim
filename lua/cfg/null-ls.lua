local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local lsputils = require("cfg.lsputils")

local sources = {
	-- Diagnostics
	null_ls.builtins.diagnostics.selene,
	null_ls.builtins.diagnostics.shellcheck,
	-- Formatting
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.mix,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.shellharden,
	null_ls.builtins.formatting.shfmt,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.surface,
	null_ls.builtins.formatting.terraform_fmt,
}

null_ls.config({ sources = sources })

lspconfig["null-ls"].setup(lsputils.make_config({}))
