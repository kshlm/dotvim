local lsp = require('vim.lsp')
local vimp = require('vimp')

local M = {}

M.on_attach = function(client, bufnr)
  -- Mappings.
  vimp.add_buffer_maps(bufnr, function()
    local bind_opts = {'silent'}
    vimp.nnoremap(bind_opts, '<c-]>', lsp.buf.definition)
    vimp.nnoremap(bind_opts, 'gh', require'telescope.builtin'.lsp_references)
    vimp.nnoremap(bind_opts, 'g0', require'telescope.builtin'.lsp_document_symbols)
    vimp.nnoremap(bind_opts, 'gW', require'telescope.builtin'.lsp_dynamic_workspace_symbols)
    vimp.nnoremap(bind_opts, '<leader>ca', require'lspsaga.codeaction'.code_action)
    vimp.nnoremap(bind_opts, 'K', require'lspsaga.hover'.render_hover_doc)
    vimp.nnoremap(bind_opts, 'gs', require'lspsaga.signaturehelp'.signature_help)
    vimp.nnoremap(bind_opts, 'gr', require'lspsaga.rename'.rename)
    vimp.nnoremap(bind_opts, 'gd', require'lspsaga.provider'.preview_definition)
    vimp.nnoremap(bind_opts, '<leader>cd', require'lspsaga.diagnostic'.show_line_diagnostics)
    vimp.nnoremap(bind_opts, ']e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_next)
    vimp.nnoremap(bind_opts, '[e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      vimp.nnoremap(bind_opts, "<leader>f", lsp.buf.formatting)
    elseif client.resolved_capabilities.document_range_formatting then
      vimp.nnoremap(bind_opts, "<leader>f", lsp.buf.range_formatting)
    end
  end)
end

return M
