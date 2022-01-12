local mapx = require("mapx")

vim.g.coq_settings = {
	keymap = { recommended = false },
	auto_start = "shut-up",
	clients = {
		tree_sitter = {
			enabled = false,
		},
	},
}


mapx.inoremap('<ESC>', [[pumvisible() ? "<C-e><ESC>" : "<ESC>"]], { expr = true})
mapx.inoremap('<C-c>', [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], { expr = true})
mapx.inoremap('<BS>', [[pumvisible() ? "<C-e><BS>" : "<BS>"]], { expr = true})
mapx.inoremap('<CR>', [[pumvisible() ? (complete_info().selected == -1 ? "<C-e><CR>" : "<C-y>") : "<CR>"]], { expr = true})
mapx.inoremap('<Tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true})
mapx.inoremap('<S-Tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true})

