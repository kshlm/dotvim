local mapx = require("mapx")

vim.g.coq_settings = {
	keymap = { recommended = false },
	auto_start = "shut-up",
}


mapx.inoremap('<ESC>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true})
mapx.inoremap('<C-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true})
mapx.inoremap('<Tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true})
mapx.inoremap('<S-Tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true})

