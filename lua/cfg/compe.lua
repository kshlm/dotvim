local compe = require("compe")
local mapx = require("mapx")

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
local bind_opts = { expr = true, silent = true }
mapx.group(bind_opts, function()
	mapx.inoremap("<C-Space>", [[ compe#complete() ]])
	mapx.inoremap("<C-e>", [[ compe#close('<C-e>) ]])
	mapx.inoremap("<C-f>", [[ compe#scroll({ 'delta': +4 }) ]])
	mapx.inoremap("<C-d>", [[ compe#scroll({ 'delta': -4 }) ]])
end)

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
local tab_complete = function()
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
local s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		return t("<S-Tab>")
	end
end
mapx.group(bind_opts, function()
	mapx.imap("<Tab>", tab_complete)
	mapx.smap("<Tab>", tab_complete)
	mapx.imap("<S-Tab>", s_tab_complete)
	mapx.smap("<S-Tab>", s_tab_complete)
end)
