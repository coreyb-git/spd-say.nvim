local M = {}

local opts = require("spd-say.opts")
local speak = require("spd-say.speak")

local function toggle()
	opts.enabled = not opts.enabled
	local s
	if opts.enabled then
		s = "On"
	else
		speak.close_speech_engine()
		s = "off"
	end

	vim.notify("Spd-Say is " .. s)
end

M.setup = function()
	vim.api.nvim_create_user_command("SpdSayToggle", toggle, {})
end

return M
