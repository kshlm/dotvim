-- All LSP related config goes here
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local saga = require('lspsaga')
local lsputils = require('cfg.lsputils')

local function setup_servers()
  lspinstall.setup()

  -- Add the servers installed by LspInstall first
  local servers = {}
  vim.tbl_map(function(lang) servers[lang] = {} end, lspinstall.installed_servers())

  -- Extend with manually installed servers and custom settings
  servers = vim.tbl_deep_extend('force', servers, {
    clangd = {},
    gopls = {
      settings = {
        gopls = {
          analyses = {
            nilness = true,
            shadow = true,
            unusedparams = true,
          },
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
        }
      }
    },
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
    servers.clangd.cmd = {'/usr/local/opt/llvm/bin/clangd'}
    servers.rnix = {}
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
      on_attach = lsputils.on_attach,
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

