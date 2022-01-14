local telescope = require("telescope")
local builtin = require("telescope.builtin")
local mapx = require("mapx")

local defaults = {
	color_devicons = true,
	layout_strategy = "flex",
	path_display = { "smart" },
	scroll_strategy = "cycle",
	sorting_strategy = "ascending",
}
local extensions = {
	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
}
telescope.setup({
	defaults = defaults,
	extensions = extensions,
})

telescope.load_extension("fzf")

mapx.group({ silent = true }, function()
	mapx.nnoremap("<C-p>", function() builtin.find_files() end)
	mapx.nnoremap("<C-b>", function() builtin.buffers() end)
	mapx.nnoremap("<leader>rg", function() builtin.live_grep() end)
	mapx.nnoremap("ts", function() builtin.builtin() end)
end)
