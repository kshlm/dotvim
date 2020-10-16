local vim = vim
local api = vim.api

-- lsp-status settings
local kind_labels_mt = {__index = function(_, k) return k end}
local kind_labels = {}
setmetatable(kind_labels, kind_labels_mt)

-- nvim-lsp settings
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')

local on_attach = function(client, bufnr)
  require'completion'.on_attach(client, bufnr)
  require'diagnostic'.on_attach(client, bufnr)

  local opts = {noremap = true, silent = true}
  -- cf. :help lsp-config for tips on what to map
  api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gO", "<cmd>lua vim.lsp.buf.references()<CR><cmd>copen<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>PrevDiagnostic<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>NextDiagnostic<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>lH", "<cmd>lua init.clear_document_highlight()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", opts)
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
  nvim_lsp[ls].setup{
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
