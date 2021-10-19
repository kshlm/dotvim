local metals = require("metals")
local lsputils = require("cfg.lsputils")

_G.metals = {}
_G.metals.initialize_or_attach = function()
	-- Remove 'F' from shortmess for metals to work correctly
	vim.opt.shortmess = vim.opt.shortmess - "F"

	local metals_config = metals.bare_config()
	metals_config.init_options.statusBarProvider = "on"
	metals_config.on_attach = lsputils.on_attach

	metals.initialize_or_attach(metals_config)
end

-- Setup an augroup to attach metals to opened Scala buffers
vim.cmd([[
  augroup metals
    au!
    au FileType scala,sbd lua metals.initialize_or_attach()
  augroup end
]])
