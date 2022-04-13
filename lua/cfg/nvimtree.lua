local nvimtree = require('nvim-tree')
local mapx = require("mapx")

vim.cmd([[ highlight link NvimTreeFolderName Title ]])
vim.cmd([[ highlight link NvimTreeFolderIcon Tag ]])
vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]])

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1

nvimtree.setup {
	actions = {
		open_file = {
			quit_on_open = true
		},
	},
	diagnostics = {
		enabled = true
	},
	git = {
		ignore = true
	},
	renderer = {
		indent_markers = {
			enable = true
		},
	},
	update_focused_file = {
		enabled = true,
	},
	update_to_buf_dir = {
		enabled = true,
		auto_open = true,
	},
}

local bind_opts = { silent  = true}
mapx.nnoremap("<F3>", ":NvimTreeToggle<CR>", bind_opts)
mapx.nnoremap("<Leader><F3>", ":NvimTreeFindFile<CR>", bind_opts)
