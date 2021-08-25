local reload = require("nvim-reload")
local vimp = require("vimp")

reload.pre_reload_hook = function()
	vimp.unmap_all()
end
