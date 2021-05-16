-- nvim-treesitter settings
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.elixir = {
  install_info = {
    url = "https://github.com/wingyplus/tree-sitter-elixir",
    branch = 'main',
    files = { "src/parser.c" }
  },
  filetype = "elixir",
  used_by = { "eelixir" },
}
require'nvim-treesitter.configs'.setup {
  autopairs = { enable = true },
  ensure_installed = 'maintained',     -- one of 'all', 'language', or a list of languages
  highlight = { enable = true },
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = { enable = true },
    navigation = { enable = true },
  },
  textobjects = { enable = true },
}
