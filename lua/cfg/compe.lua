local compe = require "compe"
local vimp = require "vimp"

compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,

  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    treesitter = true,
  }
}

-- Enable the right completeopts for Compe
vim.o.completeopt = "menu,menuone,noselect"

-- Use <Tab> <S-Tab> to navigate completions and snippets
local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return "<Plug>(vsnip-expand-or-jump)"
  else
    return "<Tab>"
  end
end

local function s_tab_complete()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  else
    return "<S-Tab>"
  end
end

local bind_opts = {'expr', 'silent'}
vimp.bind('is', bind_opts, '<Tab>', tab_complete)
vimp.bind('is', bind_opts, '<S-Tab>', s_tab_complete)
