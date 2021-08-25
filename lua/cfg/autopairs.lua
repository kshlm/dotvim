local vimp = require("vimp")
local npairs = require("nvim-autopairs")

-- skip it, if you use another global object
_G.autopairs = {}

vim.g.completion_confirm_key = ""
_G.autopairs.completion_confirm = function()
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

vimp.inoremap({ "silent", "expr" }, "<CR>", [[ v:lua.autopairs.completion_confirm() ]])

npairs.setup({
	check_ts = true,
})
