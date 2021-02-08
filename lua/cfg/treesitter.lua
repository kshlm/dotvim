-- nvim-treesitter settings
require'nvim-treesitter.configs'.setup {
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
