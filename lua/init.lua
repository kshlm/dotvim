local M = {}

function M.setup()
  pcall(require 'plugins')
  pcall(require 'cfg.lsp')
  pcall(require 'cfg.treesitter')
end

return M
