return function()
  -- nvim-lspconfig settings
  local lspconfig = require('lspconfig')

  local on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true}
    -- cf. :help lsp-config for tips on what to map
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gO", "<cmd>lua vim.lsp.buf.references()<CR><cmd>copen<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lH", "<cmd>lua init.clear_document_highlight()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  end

  local servers = {
    clangd = {},
    gopls = {},
    pyls = {
      pyls = {
        configurationSources = { "pycodestyle", "pyflakes" }
      }
    },
    rust_analyzer = {},
  }
  for ls, settings in pairs(servers) do lspconfig[ls].setup{
      on_attach = on_attach,
      settings = settings,
    }
  end

  -- lsp-diagnostic settings
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = true,
    }
  )
end
