local vim = vim
local api = vim.api
local lsp = vim.lsp

-- lsp-status settings
local kind_labels_mt = {__index = function(_, k) return k end}
local kind_labels = {}
setmetatable(kind_labels, kind_labels_mt)

-- nvim-lspconfig settings
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  require'completion'.on_attach(client, bufnr)

  local opts = {noremap = true, silent = true}
  -- cf. :help lsp-config for tips on what to map
  api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gO", "<cmd>lua vim.lsp.buf.references()<CR><cmd>copen<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lH", "<cmd>lua init.clear_document_highlight()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
end

local servers = {
  bashls = {},
  gopls = {},
  jsonls = {},
  metals = {},
  pyls = {
    pyls = {
      configurationSources = { "pycodestyle", "pyflakes" }
    }
  },
  rust_analyzer = {},
  sumneko_lua = {},
  vimls = {},
  yamlls = {},
}
for ls, settings in pairs(servers) do
  lspconfig[ls].setup{
    on_attach = on_attach,
    settings = settings,
  }
end


-- nvim-treesitter settings
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = { enable = true },
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = { enable = true },
    navigation = { enable = true },
  },
  textobjects = { enable = true },
}

-- lsp-diagnostic settings
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

-- evilline.lua
require'eviline'
