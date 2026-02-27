local M = {}

local opts = require("spd-say.opts")
local utils = require("spd-say.utils")

M.say = function(text)
	text = vim.trim(text)
	if text:len() > 0 then
		local sanitized = utils.get_sanitized_text(text)
		local spd_speech = "<speak><break time='" .. opts.initial_pause_ms .. "ms'/>" .. sanitized .. "</speak>"
		local cmd = "spd-say " .. opts.spd_say_opts .. ' "' .. spd_speech .. '" &'

		vim.fn.jobstart(cmd, { detach = true })
	end
end

M.say_last_word = function()
	M.say(utils.get_prior_word())
end

M.say_last_previous_line_last_word = function()
	M.say(utils.get_last_word_prev_line())
end

return M
