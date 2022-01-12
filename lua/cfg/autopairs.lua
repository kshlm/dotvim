local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local npairs_cmp = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", npairs_cmp.on_confirm_done({ map_char = { tex = "" } }))

npairs.setup({
	check_ts = true,
})
