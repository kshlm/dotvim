local vim = vim
local api = vim.api

-- lsp-status settings
local lsp_status = require('lsp-status')

local kind_labels_mt = {__index = function(_, k) return k end}
local kind_labels = {}
setmetatable(kind_labels, kind_labels_mt)

lsp_status.register_progress()
lsp_status.config({
  kind_labels = kind_labels,
  indicator_errors = "×",
  indicator_warnings = "!",
  indicator_info = "i",
  indicator_hint = "›",
  -- the default is a wide codepoint which breaks absolute and relative
  -- line counts if placed before airline's Z section
  status_symbol = "",
})


-- nvim-lsp settings
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')

local on_attach = function(client, bufnr)
  require'completion'.on_attach(client, bufnr)
  require'diagnostic'.on_attach(client, bufnr)
  lsp_status.on_attach(client)

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
    capabilities = vim.tbl_extend("keep", configs[ls].capabilities or {}, lsp_status.capabilities)
  }
end

--nvim_lsp.bashls.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.vimls.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.gopls.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.pyls.setup{
  --settings = {
    --pyls = {
      --configurationSources = { "pycodestyle", "pyflakes" }
    --}
  --},
  --on_attach = on_attach,
  --capabilities = lsp_status.capabilities
--}
--nvim_lsp.rust_analyzer.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.jsonls.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.yamlls.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.metals.setup{ on_attach = on_attach, capabilities = lsp_status.capabilities }
--nvim_lsp.sumneko_lua.setup{
  --cmd = { "/Users/kaushal/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/kaushal/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" },
  --on_attach = on_attach,
  --capabilities = lsp_status.capabilities
--}

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
