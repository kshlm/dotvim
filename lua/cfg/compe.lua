local compe = require("compe")
local vimp = require("vimp")

compe.setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,

	source = {
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		path = true,
		vsnip = true,
	},
})

-- Enable the right completeopts for Compe
vim.o.completeopt = "menu,menuone,noselect"

-- Mappings
local bind_opts = { "expr", "silent" }
vimp.inoremap(bind_opts, "<C-Space>", [[ compe#complete() ]])
-- vimp.inoremap(bind_opts, '<CR>', [[ compe#confirm('<CR>') ]]) -- Defined in cfg.autopairs
vimp.inoremap(bind_opts, "<C-e>", [[ compe#close('<C-e>) ]])
vimp.inoremap(bind_opts, "<C-f>", [[ compe#scroll({ 'delta': +4 }) ]])
vimp.inoremap(bind_opts, "<C-d>", [[ compe#scroll({ 'delta': -4 }) ]])

-- Use <Tab> <S-Tab> to navigate completions and snippets
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.compe = {}
_G.compe.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
		return t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.compe.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		return t("<S-Tab>")
	end
end
vimp.rbind("is", bind_opts, "<Tab>", "v:lua.compe.tab_complete()")
vimp.rbind("is", bind_opts, "<S-Tab>", "v:lua.compe.s_tab_complete()")
