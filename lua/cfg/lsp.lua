-- All LSP related config goes here
local lsp = require('vim.lsp')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local saga = require('lspsaga')
local vimp = require('vimp')

local on_attach = function(client, bufnr)
  -- Mappings.
  vimp.add_buffer_maps(bufnr, function()
    local bind_opts = {'silent'}
    vimp.nnoremap(bind_opts, '<c-]>', lsp.buf.definition)
    vimp.nnoremap(bind_opts, 'gh', require'telescope.builtin'.lsp_references)
    vimp.nnoremap(bind_opts, 'g0', require'telescope.builtin'.lsp_document_symbols)
    vimp.nnoremap(bind_opts, 'gW', require'telescope.builtin'.lsp_workspace_symbols)
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

local function setup_servers()
  lspinstall.setup()

  -- Add the servers installed by LspInstall first
  local servers = {}
  vim.tbl_map(function(lang) servers[lang] = {} end, lspinstall.installed_servers())

  -- Extend with manually installed servers and custom settings
  servers = vim.tbl_deep_extend('force', servers, {
    clangd = {},
    elixirls = {
      cmd = { "/usr/bin/elixir-ls" },
    },
    gopls = {},
    lua = {
      settings = {
        Lua = {
          runtime = {
            -- LuaJIT in the case of Neovim
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
        }
      }
    },
    rust_analyzer = {},
    zls = {},
  })
  if vim.fn.has('mac') then
    servers.elixirls = nil
    servers.clangd.cmd = {'/usr/local/opt/llvm/bin/clangd'}
  end

  local make_config = function(config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      }
    }
    return vim.tbl_extend('error', {
      capabilities = capabilities,
      on_attach = on_attach,
    }, config)
  end

  for lang, config in pairs(servers) do
    lspconfig[lang].setup(make_config(config))
  end
end
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
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

-- lspsaga settings
saga.init_lsp_saga(
  {
    code_action_prompt = {
      sign = false,
    }
  }
)

