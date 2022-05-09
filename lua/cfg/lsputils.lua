local lsp = require("vim.lsp")
local mapx = require("mapx")
local cmp = require("cmp_nvim_lsp")

local M = {}

local on_attach = function(client, bufnr)
	-- Only set the mappings once
	if vim.b.lsp_bindings_set then
		return
	end
	vim.b.lsp_bindings_set = true

	-- Mappings
	mapx.group({ silent = true, buffer = bufnr }, function()
		-- Inbuilt LSP functions
		mapx.nnoremap("<c-]>", lsp.buf.definition)
		-- Set some keybinds conditional on server capabilities
		if client.resolved_capabilities.document_formatting then
			mapx.nnoremap("<leader>f", function()
				lsp.buf.formatting()
			end)
		elseif client.resolved_capabilities.document_range_formatting then
			mapx.nnoremap("<leader>f", function()
				lsp.buf.range_formatting()
			end)
		end
		-- Telescope functions
		mapx.nnoremap("gr", function()
			require("telescope.builtin").lsp_references()
		end)
		mapx.nnoremap("g0", function()
			require("telescope.builtin").lsp_document_symbols()
		end)
		mapx.nnoremap("gW", function()
			require("telescope.builtin").lsp_dynamic_workspace_symbols()
		end)

		-- LSPSaga functions
		mapx.nnoremap("<leader>ca", require("lspsaga.codeaction").code_action)
		mapx.nnoremap("K", require("lspsaga.hover").render_hover_doc)
		mapx.nnoremap("gs", require("lspsaga.signaturehelp").signature_help)
		mapx.nnoremap("gR", require("lspsaga.rename").rename)
		mapx.nnoremap("gd", require("lspsaga.provider").preview_definition)
		mapx.nnoremap("<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics)
		mapx.nnoremap("]e", require("lspsaga.diagnostic").navigate("next"))
		mapx.nnoremap("[e", require("lspsaga.diagnostic").navigate("prev"))
	end)
end

M.make_config = function(config)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	config = vim.tbl_extend("error", {
		capabilities = cmp.update_capabilities(capabilities),
		-- on_attach = on_attach,
	}, config)
	return config
end

return M
