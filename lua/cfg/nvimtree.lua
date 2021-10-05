local nvimtree = require('nvim-tree')
local mapx = require("mapx")

vim.cmd([[ highlight link NvimTreeFolderName Title ]])
vim.cmd([[ highlight link NvimTreeFolderIcon Tag ]])

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1

nvimtree.setup {
	auto_close = true,
	lsp_diagnostics = true,
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
