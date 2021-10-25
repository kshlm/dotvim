local mapx = require("mapx")
local npairs = require("nvim-autopairs")

vim.g.completion_confirm_key = ""
local npairs_cr = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return npairs.esc("<C-y>")
		else
			return npairs.esc("<C-e>")..npairs.esc("<CR>")
		end
	else
		return npairs.autopairs_cr()
	end
end

local npairs_bs = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
	end
end

mapx.inoremap("<CR>", npairs_cr, {silent = true, expr = true})
mapx.inoremap("<BS>", npairs_bs, {silent = true, expr = true})

npairs.setup({
	check_ts = true,
})
