local group = vim.api.nvim_create_augroup("spd-say", { clear = true })

local pronunciation = require("spd-say.pronunciation")

local opts = require("spd-say.opts")
local speak = require("spd-say.speak")
local utils = require("spd-say.utils")

---- QOL filetype settings
vim.api.nvim_create_autocmd("BufEnter", {
	group = group,
	callback = function()
		if (not opts.enabled) or not opts.auto_set_patterns then
			return
		end
		if vim.bo.buftype ~= "" then
			return
		end

		utils.configure_for_current_buffer()
	end,
})

-- for the word/sentence under cursor to fight over.
local queued_text = ""
local queued_pronunciation_table = {}

local last_cursormove_word = ""
local last_cursormove_sentence = ""
local last_cursormove_row = -1

-- Graceful exit!
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = group,
	callback = function()
		speak.close_speech_engine()
	end,
})

local function handle_cursor_word()
	local text = utils.get_word_under_cursor()
	if text == " " then
		last_cursormove_word = ""
		return
	end

	if text == last_cursormove_word then
		return
	end

	last_cursormove_word = text
	queued_text = text
	queued_pronunciation_table = pronunciation.words
end

local function handle_cursor_sentence()
	local sentence = utils.get_sentence_under_cursor()
	if sentence == last_cursormove_sentence then
		return
	end

	last_cursormove_sentence = sentence
	queued_text = sentence
	queued_pronunciation_table = pronunciation.sentences
end

local function handle_cursor_line()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	if row == last_cursormove_row then
		return
	end

	last_cursormove_row = row
	queued_text = vim.api.nvim_get_current_line()
	queued_pronunciation_table = pronunciation.lines

	if vim.trim(queued_text) == "" then
		speak.stop() -- go silent when moving to an empty line.
	end
end

vim.api.nvim_create_autocmd("ModeChanged", {
	group = group,
	callback = function()
		if not opts.enabled then
			return
		end

		local prior_mode = vim.v.event.old_mode
		local mode = vim.api.nvim_get_mode().mode
		if mode == "i" then
			if prior_mode:sub(1, 1) ~= "i" then -- if we weren't already in some form of insert mode, go quiet.
				speak.stop()
			end
		end

		if mode == "n" then
			if prior_mode == "i" then
				ignore_next_cursormoved = true
			end

			handle_cursor_word()
			speak.say(queued_text)
			-- don't continuously repeat the current sentence after any little edit.
			last_cursormove_sentence = utils.get_sentence_under_cursor()
		end
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = group,
	callback = function()
		if ignore_next_cursormoved then
			ignore_next_cursormoved = false
			return
		end
		if not opts.enabled then
			return
		end
		if vim.api.nvim_get_mode().mode ~= "n" then
			return
		end

		queued_text = ""
		if opts.events.cursor_onto.word then
			handle_cursor_word()
		end
		if opts.events.cursor_onto.sentence then
			handle_cursor_sentence()
		end
		if opts.events.cursor_onto.line then
			handle_cursor_line()
		end
		speak.say(queued_text, queued_pronunciation_table)
	end,
})

vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		if (not opts.enabled) or not opts.events.finished_typing_word then
			return
		end

		local vocalize = false
		local last_word = ""
		-- trigger chars
		if utils.is_trigger_char(vim.v.char, opts.typing_triggers) then
			vocalize = true
			last_word = utils.get_prior_word()
			-- Don't repeat if the current key is a space,
			-- and the prior word was already spoken.
			if vim.v.char == " " then
				if last_word == "" then
					vocalize = false
				else
					local last_char = last_word:sub(-1)
					if utils.is_trigger_char(last_char, opts.typing_triggers) then
						vocalize = false
					end
				end
			end
		end

		if vocalize then
			speak.say(last_word .. vim.v.char, pronunciation.words) -- char isn't included in insertcharpre
		end
	end,
})
