local M = {}

local opts = require("spd-say.opts")
local utils = require("spd-say.utils")

local pending_text = ""

M.clear = function()
	pending_text = ""
end
-- sdfasdfasdf
M.say_now = function(text)
	vim.notify("saying: " .. text)
	text = vim.trim(text)
	if text:len() > 0 then
		local sanitized = utils.get_sanitized_text(text)
		local modifier = ""
		if opts.speak_symbols then
			modifier = " -m all "
		end
		local spd_speech = "<speak><break time='200ms'/>" .. sanitized .. "</speak>"
		local cmd = "spd-say -x " .. modifier .. '"' .. spd_speech .. '" &'
		vim.schedule(function()
			local handle = io.popen(cmd)
			if handle then
				local result = handle:read("*a")
				handle:close()

				if result and result ~= "" then
					vim.notify("Spd-say Error: " .. result, vim.log.levels.ERROR)
				end
			end
		end)
	end
end

M.talk = function()
	M.say_now(pending_text)
	M.clear()
end

M.add_word = function(add_word)
	pending_text = pending_text .. " " .. add_word
end

M.add_text = function(add_text)
	pending_text = pending_text .. add_text
end

M.remove_last_letter = function()
	pending_text = pending_text:sub(1, -2)
	vim.notify(pending_text)
end

return M
