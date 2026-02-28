local M = {}

require("spd-say.autocmds")
require("spd-say.keys")
local opts = require("spd-say.opts")
require("spd-say.cmds").setup()

M.setup = function(custom_opts)
	vim.tbl_extend("force", opts, custom_opts)
end

return M
