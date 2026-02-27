local M = {}

require("spd-say.autocmds")
require("spd-say.keys")
local opts = require("spd-say.opts")
local utils = require("spd-say.utils")

vim.api.nvim_create_user_command("SpdSay Toggle", utils.toggle, {})

M.setup = function(custom_opts)
	vim.tbl_extend("force", opts, custom_opts)
end

return M

-- `` ` ` ` ` `' ' ' ' ' '  `' ' '  '. '
-- '  ' ' '
