-- nvim-treesitter settings
require("nvim-treesitter.configs").setup({
	autopairs = { enable = true },
	autotag = { enable = true },
	ensure_installed = "maintained",
	highlight = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = { enable = true },
		navigation = { enable = true },
	},
	textobjects = { enable = true },
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.used_by = "octo"
