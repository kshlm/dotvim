-- Set the colorscheme to Dracula Pro and customize highlights
vim.cmd([[
  colorscheme dracula_pro
  syntax on
]])

-- Customize GitSigns and Treesitter highlights
-- Taken from the normal Dracula theme https://github.com/dracula/vim/blob/master/after/plugin/dracula.vim
-- License: https://github.com/dracula/vim/blob/master/LICENSE

-- gitsigns
vim.cmd([[
  hi! link GitSignsAdd      DiffAdd
  hi! link GitSignsAddLn    DiffAdd
  hi! link GitSignsAddNr    DiffAdd
  hi! link GitSignsChange   DiffChange
  hi! link GitSignsChangeLn DiffChange
  hi! link GitSignsChangeNr DiffChange
  hi! link GitSignsDelete   DiffDelete
  hi! link GitSignsDeleteLn DiffDelete
  hi! link GitSignsDeleteNr DiffDelete
]])

-- treesitter
vim.cmd([[
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol DraculaPurple
  hi! link TSAnnotation DraculaYellow
  hi! link TSAttribute DraculaGreenItalic
  " # Functions
  hi! link TSFuncBuiltin DraculaCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter DraculaOrangeItalic
  hi! link TSParameterReference DraculaOrange
  hi! link TSField DraculaOrange
  hi! link TSConstructor DraculaCyan
  " # Keywords
  hi! link TSLabel DraculaPurpleItalic
  " # Variable
  hi! link TSVariableBuiltin DraculaPurpleItalic
  " # Text
  hi! link TSStrong DraculaFgBold
  hi! link TSEmphasis DraculaFg
  hi! link TSUnderline Underlined
  hi! link TSTitle DraculaYellow
  hi! link TSLiteral DraculaYellow
  hi! link TSURI DraculaYellow
]])
