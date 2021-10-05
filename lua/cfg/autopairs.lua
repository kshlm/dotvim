local mapx = require("mapx")
local npairs = require("nvim-autopairs")

vim.g.completion_confirm_key = ""
local completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"](npairs.esc("<CR>"))
		else
			return npairs.esc("<CR>")
		end
	else
		return npairs.autopairs_cr()
	end
end

mapx.inoremap("<CR>", completion_confirm, {silent = true, expr = true})

npairs.setup({
	check_ts = true,
})
