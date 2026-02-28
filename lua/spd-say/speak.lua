local M = {}

local job_id = nil

local opts = require("spd-say.opts")
local utils = require("spd-say.utils")

local function get_cmd()
	local tbl = {
		opts.spd_say_flags.ssml,
		opts.spd_say_flags.pipe,
		opts.spd_say_flags.priority,
		opts.spd_say_flags.punctuation_mode,
		opts.spd_say_flags.wait,
		opts.spd_say_flags.voice,
	}
	local flags = table.concat(tbl, " ")
	local cmd = opts.spd_say_cmd .. " " .. flags
	return cmd
end

M.start_speech_engine = function()
	if not job_id then
		vim.notify("starting speech engine")
		local cmd = get_cmd()

		job_id = vim.fn.jobstart(cmd, {
			on_exit = function()
				job_id = nil
			end,
		})
	end
end

M.close_speech_engine = function()
	if job_id then
		vim.fn.chanclose(job_id, "stdin")
		job_id = nil
	end
end

local function get_pause(ms)
	return "<break time ='" .. ms .. "ms'/>"
end

local function get_speech(text)
	text = vim.trim(text)
	if text:len() > 0 then
		local pronunciation = utils.get_pronunciation(text)
		local start_pause = get_pause(opts.initial_pause_ms)
		local end_pause = get_pause(opts.end_pause_ms)
		local speech = "<speak>" .. start_pause .. pronunciation .. end_pause .. "</speak>"
		return speech
	end
	return ""
end

local last_spoken_word = ""
M.reset_last_spoken_word = function()
	last_spoken_word = ""
end

M.say = function(text)
	if text:len() < 1 then
		return
	end
	if vim.api.nvim_get_mode().mode ~= "n" then
		M.reset_last_spoken_word()
	end
	if opts.dont_repeat and (text == last_spoken_word) then
		return
	end
	last_spoken_word = text

	M.start_speech_engine()
	if not job_id then
		vim.notify("Failed to start the speech engine.")
		return
	end

	local speech = get_speech(text)
	vim.fn.chansend(job_id, speech)
	vim.fn.chansend(job_id, "\n")
end

M.say_cursor_word = function()
	local text = utils.get_word_under_cursor()
	if text == " " then
		M.reset_last_spoken_word()
		return
	end

	M.say(utils.get_word_under_cursor())
end

M.say_last_word = function()
	M.say(utils.get_prior_word())
end

M.say_last_previous_line_last_word = function()
	M.say(utils.get_last_word_prev_line())
end

return M
