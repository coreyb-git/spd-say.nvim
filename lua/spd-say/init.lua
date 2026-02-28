local M = {}

require("spd-say.autocmds")
require("spd-say.keys")
local opts = require("spd-say.opts")
require("spd-say.cmds").setup()

M.setup = function(custom_opts)
	for k, v in pairs(custom_opts) do
		opts[k] = v
	end
end

return M
