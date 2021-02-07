local M = {}

function M.setup()
  pcall(require 'plugins')
  pcall(require 'cfg.lsp')
  pcall(require 'cfg.treesitter')
  pcall(require 'cfg.telescope')
  pcall(require 'cfg.nvimtree')
end

return M
