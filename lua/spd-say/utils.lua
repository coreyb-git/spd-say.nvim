local M = {}

local opts = require("spd-say.opts")
local pronunciation = require("spd-say.pronunciation")

M.get_pronunciation = function(text)
	text = " " .. text .. " "
	for _, sub in ipairs(pronunciation) do
		local pattern = sub[1]
		local replacement = sub[2]
		text = (text:gsub(pattern, " " .. replacement .. " "))
	end

	return text
end

M.is_trigger_char = function(char, under_cursor_triggers)
	local triggers
	if not under_cursor_triggers then
		triggers = opts.triggers
	else
		triggers = opts.triggers_under_cursor
	end
	if string.find(triggers, char, 1, true) then
		return true
	end
	return false
end

M.get_word_under_cursor = function()
	local line = vim.api.nvim_get_current_line()
	-- Column is 0-indexed, Lua strings are 1-indexed.
	-- To look at the char the cursor is EXACTLY on, add 1.
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1
	local char_at_cursor = line:sub(col, col)

	-- IMMEDIATE STOP: If the current char is a trigger, return nothing.
	-- Silent space chars.
	if M.is_trigger_char(char_at_cursor, true) then
		return char_at_cursor
	end

	-- Only if we are NOT on a trigger, expand left
	local start = col
	while (start > 1) and (not M.is_trigger_char(line:sub(start - 1, start - 1), true)) do
		start = start - 1
	end

	-- Only if we are NOT on a trigger, expand right
	local final = col
	local max = line:len()
	while (final < max) and (not M.is_trigger_char(line:sub(final + 1, final + 1), true)) do
		final = final + 1
	end

	return line:sub(start, final)
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

return M
