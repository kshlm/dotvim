local nvimtree = require('nvim-tree')
local mapx = require("mapx")

vim.cmd([[ highlight link NvimTreeFolderName Title ]])
vim.cmd([[ highlight link NvimTreeFolderIcon Tag ]])
vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]])

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1

nvimtree.setup {
	diagnostics = {
		enable = true,
	},
	git = {
		ignore = true,
	},
	hijack_cursor = true,
	open_on_setup = true,
	renderer = {
		indent_markers = {
			enable = true
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
}

local bind_opts = { silent  = true}
mapx.nnoremap("<F3>", ":NvimTreeToggle<CR>", bind_opts)
mapx.nnoremap("<Leader><F3>", ":NvimTreeFindFile<CR>", bind_opts)
