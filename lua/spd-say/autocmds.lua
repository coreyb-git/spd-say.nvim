local group = vim.api.nvim_create_augroup("spd-say", { clear = true })

local opts = require("spd-say.opts")
local speak = require("spd-say.speak")
local utils = require("spd-say.utils")

-- Graceful exit!
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = group,
	callback = function()
		speak.close_speech_engine()
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = group,
	callback = function()
		if (not opts.enabled) or not opts.speak_on_cursormoved then
			return
		end
		if vim.api.nvim_get_mode().mode ~= "n" then
			return
		end

		speak.say_cursor_word()
	end,
})

vim.api.nvim_create_autocmd("CursorHoldI", {
	group = group,
	callback = function()
		if (not opts.enabled) or not opts.speak_on_cursorholdi then
			return
		end

		speak.say_last_word()
	end,
})

vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		if not opts.enabled then
			return
		end

		local vocalize = false
		local last_word = ""
		-- trigger chars
		if utils.is_trigger_char(vim.v.char) then
			vocalize = true
			last_word = utils.get_prior_word()
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
			speak.say(last_word .. vim.v.char) -- char isn't included in insertcharpre
		end
	end,
})
