local M = {}

local opts = require("spd-say.opts")
-- test.
M.get_sanitized_text = function(text)
	local san = " " .. text .. " "
	--
	vim.notify("before: " .. san)
	for symbol, replacement in pairs(opts.pronunciation) do
		san = san:gsub(symbol, " " .. replacement .. " ")
	end
	vim.notify("after: " .. san)

	return san
end

M.is_trigger_char = function(char)
	if string.find(opts.speak_on_characters, char, 1, true) then
		return true
	end
	return false
end

M.get_prior_word = function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]

	-- Get the string from the start of the line to the cursor
	local line_to_cursor = line:sub(1, col)

	-- Match the last chunk of non-space characters
	local capture = line_to_cursor:match("(%S+)$")
	return capture or ""
end

M.get_last_word_prev_line = function()
	local curr_row = vim.api.nvim_win_get_cursor(0)[1]
	if curr_row <= 1 then
		return ""
	end
	local prev_line = vim.api.nvim_buf_get_lines(0, curr_row - 2, curr_row - 1, false)[1]
	if not prev_line or prev_line == "" then
		return ""
	end
	local last_word = prev_line:match("(%S+)$")

	return last_word or ""
end

M.toggle = function()
	opts.enabled = not opts.enabled
	local s
	if opts.enabled then
		s = "On"
	else
		s = "off"
	end
	vim.notify("Spd-Say is " .. s)
end

return M
