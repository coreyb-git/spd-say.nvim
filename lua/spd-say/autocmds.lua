local group = vim.api.nvim_create_augroup("spd-say", { clear = true })

local opts = require("spd-say.opts")
local speak = require("spd-say.speak")
local utils = require("spd-say.utils")

vim.api.nvim_create_autocmd("CursorHoldI", {
	group = group,
	callback = function()
		if not opts.speak_on_cursorhold then
			return
		end

		speak.say_last_word()
	end,
})

vim.keymap.set("i", "<CR>", function()
	local last_word = utils.get_prior_word()
	if last_word ~= "" then
		speak.say(last_word)
	end
	return "<CR>"
end, { expr = true, buffer = true, replace_keycodes = true })

vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		local vocalize = false
		local last_word = ""
		-- trigger chars
		if utils.is_trigger_char(vim.v.char) then
			vocalize = true
			last_word = utils.get_prior_word()
			vim.notify("last word: " .. last_word)
			-- Don't repeat if the current key is a space,
			-- and the prior word was already spoken.
			if vim.v.char == " " then
				if last_word == "" then
					vocalize = false
				else
					local last_char = last_word:sub(-1)
					if utils.is_trigger_char(last_char) then
						vocalize = false
					end
				end
			end
		end

		if vocalize then
			speak.say(last_word .. vim.v.char)  -- char isn't included in insertcharpre
		end
	end,
})
