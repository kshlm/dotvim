local null_ls = require("null-ls")
local lsputils = require("cfg.lsputils")

local sources = {
	-- Diagnostics
	null_ls.builtins.diagnostics.codespell,
	-- null_ls.builtins.diagnostics.editorconfig_checker,
	-- null_ls.builtins.diagnostics.selene,
	null_ls.builtins.diagnostics.shellcheck,

	-- Formatting
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.clang_format,
	-- null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.mix,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.shellharden,
	null_ls.builtins.formatting.shfmt,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.surface,
	null_ls.builtins.formatting.terraform_fmt,

	-- Code Actions
	null_ls.builtins.code_actions.gitsigns
}

null_ls.setup(lsputils.make_config({ sources = sources }))
