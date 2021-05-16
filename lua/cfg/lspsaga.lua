local saga = require 'lspsaga'
local vimp = require 'vimp'

saga.init_lsp_saga(
  {
    code_action_prompt = {
      sign = false,
    }
  }

)

vimp.nnoremap({'silent'}, 'gh', require'lspsaga.provider'.lsp_finder)
vimp.nnoremap({'silent'}, '<leader>ca', require'lspsaga.codeaction'.code_action)
vimp.nnoremap({'silent'}, 'K', require'lspsaga.hover'.render_hover_doc)
vimp.nnoremap({'silent'}, 'gs', require('lspsaga.signaturehelp').signature_help)
vimp.nnoremap({'silent'}, 'gr', require('lspsaga.rename').rename)
vimp.nnoremap({'silent'}, 'gd', require'lspsaga.provider'.preview_definition)
vimp.nnoremap({'silent'}, '<leader>cd', require'lspsaga.diagnostic'.show_line_diagnostics)
vimp.nnoremap({'silent'}, ']e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_next)
vimp.nnoremap({'silent'}, '[e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev)
