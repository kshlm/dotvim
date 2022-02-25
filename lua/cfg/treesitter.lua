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
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.octo = "markdown"
