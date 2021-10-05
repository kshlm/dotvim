local telescope = require("telescope")
local builtin = require("telescope.builtin")
local mapx = require("mapx")

local cfg = {
	color_devicons = true,
	layout_strategy = "flex",
	path_display = { "shorten" },
	scroll_strategy = "cycle",
	sorting_strategy = "ascending",
}
telescope.setup({ defaults = cfg })

mapx.group({ silent = true }, function()
	mapx.nnoremap("<C-p>", function() builtin.find_files() end)
	mapx.nnoremap("<C-b>", function() builtin.buffers() end)
	mapx.nnoremap("<leader>rg", function() builtin.live_grep() end)
	mapx.nnoremap("ts", function() builtin.builtin() end)
end)
