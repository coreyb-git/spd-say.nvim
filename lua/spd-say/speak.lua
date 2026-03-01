local M = {}

local job_id = nil

local opts = require("spd-say.opts")

local function get_cmd()
	local tbl = {
		opts.spd_say_flags.rate_ms,
		opts.spd_say_flags.pitch,
		opts.spd_say_flags.synthesis_voice,
		opts.spd_say_flags.ssml,
		opts.spd_say_flags.pipe,
		opts.spd_say_flags.priority,
		opts.spd_say_flags.punctuation_mode,
		opts.spd_say_flags.wait,
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
		M.stop()
		vim.fn.chanclose(job_id, "stdin")
		job_id = nil
	end
end

local function get_pause(ms)
	return "<break time ='" .. ms .. "ms'/>"
end

local function get_pronunciation(text, pronunciation_table)
	text = " " .. text .. " "
	for _, sub in ipairs(pronunciation_table) do
		local pattern = sub[1]
		local replacement = sub[2]
		text = (text:gsub(pattern, " " .. replacement .. " "))
	end

	return text
end

local function get_speech(text, pronunciation_table)
	text = vim.trim(text)
	if text:len() > 0 then
		local pronunciation = get_pronunciation(text, pronunciation_table)
		local start_pause = get_pause(opts.speech_pause_ms.before)
		local end_pause = get_pause(opts.speech_pause_ms.after)
		local speech = "<speak>" .. start_pause .. pronunciation .. end_pause .. "</speak>"
		return speech
	end
	return ""
end

M.stop = function()
	if job_id then
		vim.fn.jobstart({ "spd-say", opts.spd_say_flags.cancel }, { on_exit = function() end })
	end
end

M.say = function(text, pronunciation_table)
	if text:len() < 1 then
		return
	end

	vim.defer_fn(function()
		M.start_speech_engine()
		if not job_id then
			vim.notify("Failed to start the speech engine.")
			return
		end

		local speech = get_speech(text, pronunciation_table)

		--	vim.notify("speech:" .. speech)

		vim.fn.chansend(job_id, speech)
		vim.fn.chansend(job_id, "\n")
	end, opts.respeak_delay_ms)
end

return M
